# frozen_string_literal: true

require 'dimples'
require 'json'
require 'time'

module UsesThis
  class API
    VERSION = 2
    URL = "https://usesthis.com/api"
    LINK_PATTERN = /^\[(.+)\]: http.+/.freeze
    SLICE_KEYS = %i[slug name title description date summary url api_url].freeze

    attr_accessor :paths, :gear, :interviews, :categories, :stats

    def self.generate(source_path, destination_path)
      new(source_path, destination_path).generate
    end

    def initialize(source_path, destination_path)
      @paths = {
        source: source_path,
        destination: File.join(destination_path, 'api')
      }

      @gear = { hardware: {}, software: {} }
      @interviews = []
      @categories = {}
      @stats = {}
    end

    def generate
      scan_gear
      scan_interviews

      generate_gear_endpoints
      generate_interview_endpoints
      generate_category_endpoints
      generate_stat_endpoints
    end

    private

    def scan_gear
      %i[hardware software].each do |type|
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

      Dir[source_path].each { |path| @interviews << prepare_interview(path) }

      @interviews.sort_by! { |interview| interview[:date] }.reverse!
    end

    def generate_gear_endpoints
      %i[hardware software].each do |type|
        gear_path = File.join(@paths[:destination], type.to_s)

        pager = Dimples::Pager.new(
          "#{URL}/#{type}/",
          @gear[type].to_a,
          pager_options
        )

        pager.each do |index|
          paged_gear = pager.posts_at(index).map do |_, item|
            @stats[type][:all][item[:slug].to_sym] = item[:interviews].count
            item.slice(*SLICE_KEYS)
          end

          output = { gear: paged_gear, links: pager.to_context[:urls] }
          generate_paged_json_file(gear_path, index, output)
        end

        @gear[type].each do |slug, item|
          path = File.join(gear_path, slug.to_s, 'index.json')
          generate_json_file(path, item: item)
        end
      end
    end

    def generate_interview_endpoints
      interviews_path = File.join(@paths[:destination], 'interviews')

      generate_paginated_interview_endpoints(
        interviews_path,
        "#{URL}/interviews/",
        @interviews
      )

      @interviews.each do |interview|
        path = File.join(interviews_path, interview[:slug], 'index.json')
        generate_json_file(path, interview: interview)
      end
    end

    def generate_category_endpoints
      categories_path = File.join(@paths[:destination], 'categories')

      categories = @categories.keys.sort.map do |slug|
        @categories[slug].slice(*SLICE_KEYS)
      end

      path = File.join(categories_path, 'index.json')
      generate_json_file(path, categories: categories)

      @categories.each do |slug, category|
        category_path = File.join(categories_path, slug)

        generate_paginated_interview_endpoints(
          category_path,
          "#{URL}/categories/#{slug}",
          category[:interviews]
        )
      end
    end

    def generate_stat_endpoints
      stats_path = File.join(@paths[:destination], 'stats')

      stats = {
        interviews: @interviews.count,
        hardware: @gear[:hardware].count,
        software: @gear[:software].count
      }

      generate_json_file(File.join(stats_path, 'index.json'), stats: stats)

      %i[hardware software].each do |type|
        @stats[type].each do |key, values|
          time_period = key != :all ? key.to_s : ''
          path = File.join(stats_path, type.to_s, time_period, 'index.json')

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

    def generate_paginated_interview_endpoints(path, url, interviews)
      pager = Dimples::Pager.new(url, interviews, pager_options)

      pager.each do |index|
        paged_interviews = pager.posts_at(index).map do |interview|
          interview.slice(*SLICE_KEYS)
        end

        output = {
          interviews: paged_interviews,
          links: pager.to_context[:urls]
        }

        generate_paged_json_file(path, index, output)
      end
    end

    def prepare_interview(path)
      metadata, contents = Dimples::FrontMatter.parse(File.read(path))
      slug = File.basename(path, ".markdown")

      {}.tap do |interview|
        interview[:slug] = slug
        interview[:name] = metadata[:title]
        interview[:url] = "https://usesthis.com/interviews/#{slug}",
        interview[:api_url] = "#{URL}/interviews/#{slug}",
        interview[:contents] = contents,
        interview[:date] = metadata[:date].iso8601,
        interview[:gear] = []

        metadata[:categories].each do |category_slug|
          add_category_interview(category_slug, interview)
        end

        contents.scan(LINK_PATTERN).flatten.map do |gear_slug|
          add_gear_interview(gear_slug, interview)
          interview[:gear] << find_gear(gear_slug)&.slice(*SLICE_KEYS)
        end
      end
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

    def add_category_interview(category_slug, interview)
      name = category_slug.capitalize

      @categories[category_slug] ||= {
        slug: category_slug,
        name: name,
        url: "http://usesthis.com/categories/#{category_slug}",
        api_url: "#{URL}/categories/#{category_slug}",
        interviews: []
      }

      @categories[category_slug][:interviews] << interview.slice(*SLICE_KEYS)
    end

    def add_gear_interview(gear_slug, interview)
      item = find_gear(gear_slug)
      return if item.nil?

      item[:interviews] << interview.slice(*SLICE_KEYS)

      increment_gear_count(gear_slug, interview[:date][0..3])
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

    def pager_options
      @pager_options ||= {
        page_prefix: '?page=',
        per_page: 50
      }
    end
  end
end
