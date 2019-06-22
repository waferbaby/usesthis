# frozen_string_literal: true

require 'date'
require 'dimples'
require 'json'

module UsesThis
  # A class modelling the usesthis.com API.
  class API
    VERSION = 2
    URL = "https://usesthis.com/api/v#{VERSION}"
    LINK_PATTERN = /^\[(.+)\]: http.+/.freeze
    INTERVIEW_FILENAME_PATTERN = /(\d{4}-\d{2}-\d{2})-(.+)/.freeze
    SLICE_KEYS = %i[slug name title description summary url api_url].freeze
    PAGER_OPTIONS = { page_prefix: '?page=', per_page: 50 }.freeze

    attr_accessor :paths, :gear, :interviews, :stats

    def self.generate(source_path, destination_path)
      new(source_path, destination_path).generate
    end

    def initialize(source_path, destination_path)
      @paths = {
        source: source_path,
        destination: File.join(destination_path, 'api', "v#{VERSION}")
      }

      %i[interviews hardware software stats].each do |section|
        @paths[section] = File.join(@paths[:destination], section.to_s)
      end

      @gear = {}
      @interviews = {}
      @stats = {}
    end

    def generate
      scan_gear
      scan_interviews

      generate_gear_endpoints
      generate_interview_endpoints
      generate_stat_endpoints
    end

    private

    def scan_gear
      %i[hardware software].each do |type|
        @gear[type] = {}
        @stats[type] = { all: {} }

        source_path = File.join(
          @paths[:source],
          'gear',
          type.to_s,
          '**',
          '*.json'
        )

        Dir[source_path].sort.each do |path|
          item = prepare_gear_item(path, type)
          @gear[type][item[:slug].to_sym] = item
        end
      end
    end

    def scan_interviews
      source_path = File.join(@paths[:source], 'posts', '*.markdown')

      Dir[source_path].sort.reverse_each do |path|
        interview = prepare_interview(path)
        @interviews[interview[:slug].to_sym] = interview
      end
    end

    def generate_gear_endpoints
      %i[hardware software].each do |type|
        pager = Dimples::Pager.new(
          "#{URL}/#{type}/",
          @gear[type].to_a,
          PAGER_OPTIONS
        )

        pager.each do |index|
          paged_gear = pager.posts_at(index).map do |_, item|
            @stats[type][:all][item[:slug].to_sym] = item[:interviews].count
            item.slice(*SLICE_KEYS)
          end

          output = { gear: paged_gear, links: pager.to_context[:urls] }
          generate_paged_json_file(@paths[type], index, output)
        end

        @gear[type].each do |slug, item|
          path = File.join(@paths[type].to_s, slug.to_s, 'index.json')
          generate_json_file(path, item: item)
        end
      end
    end

    def generate_interview_endpoints
      pager = Dimples::Pager.new(
        "#{URL}/interviews/",
        @interviews.to_a,
        PAGER_OPTIONS
      )

      pager.each do |index|
        paged_interviews = pager.posts_at(index).map do |_, interview|
          interview.slice(*SLICE_KEYS)
        end

        output = {
          interviews: paged_interviews,
          links: pager.to_context[:urls]
        }

        generate_paged_json_file(@paths[:interviews], index, output)
      end

      @interviews.each do |slug, interview|
        path = File.join(@paths[:interviews], slug.to_s, 'index.json')
        generate_json_file(path, interview: interview)
      end
    end

    def generate_stat_endpoints
      stats = {
        interviews: @interviews.count,
        hardware: @gear[:hardware].count,
        software: @gear[:software].count
      }

      generate_json_file(File.join(@paths[:stats], 'index.json'), stats: stats)

      %i[hardware software].each do |type|
        @stats[type].each do |key, values|
          path = File.join(
            @paths[:stats],
            type.to_s,
            key != :all ? key.to_s : '',
            'index.json'
          )

          output = values.sort_by(&:last).reverse[0..49].map do |slug, count|
            @gear[type][slug.to_sym].slice(*SLICE_KEYS).merge(count: count)
          end

          generate_json_file(path, stats: output)
        end
      end
    end

    def prepare_gear_item(path, type)
      slug = File.basename(path, '.json')
      data = File.read(path)
      item = JSON.parse(data, symbolize_names: true)

      item.merge(
        slug: slug,
        api_url: "#{URL}/#{type}/#{slug}",
        interviews: []
      )
    end

    def prepare_interview(path)
      base_name = File.basename(path, '.markdown')
      date_string, slug = base_name.scan(INTERVIEW_FILENAME_PATTERN)[0]

      data = File.read(path)
      date = Date.parse(date_string)

      contents, interview = Dimples::FrontMatter.parse(data)
      interview[:name] = interview.delete(:title)

      interview.merge!(
        slug: slug,
        url: "https://usesthis.com/interviews/#{slug}",
        api_url: "#{URL}/interviews/#{slug}",
        contents: contents,
        date: date.iso8601
      )

      interview[:gear] = contents.scan(LINK_PATTERN).flatten.map do |gear_slug|
        item = find_gear(gear_slug)
        item[:interviews] << interview.slice(*SLICE_KEYS)

        increment_gear_count(gear_slug, date.year)

        item.slice(*SLICE_KEYS)
      end

      interview
    end

    def generate_json_file(path, data)
      FileUtils.mkdir_p(File.dirname(path))

      File.open(path, 'w') { |file_path| file_path.write(JSON.generate(data)) }
    end

    def generate_paged_json_file(path, page_number, data)
      filename = if page_number == 1
                   'index.json'
                 else
                   "page_#{page_number}.json"
                 end

      generate_json_file(File.join(path, filename), data)
    end

    def increment_gear_count(slug, year)
      type = gear_type(slug)

      @stats[type][year] ||= Hash.new(0)
      @stats[type][year][slug.to_sym] += 1
    end

    def gear_type(slug)
      @gear[:hardware][slug.to_sym] ? :hardware : :software
    end

    def find_gear(slug)
      slug_sym = slug.to_sym
      @gear[:hardware][slug_sym] || @gear[:software][slug_sym]
    end
  end
end
