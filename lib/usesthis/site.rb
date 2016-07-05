module UsesThis
  class Site < Dimples::Site
    REDIS_STATS_KEY = 'usesthis_stats'.freeze

    attr_accessor :hardware
    attr_accessor :software
    attr_accessor :inspired_links
    attr_accessor :personal_links
    attr_accessor :sponsor_links
    attr_accessor :stats

    def initialize(config = {})
      super

      @hardware = {}
      @software = {}

      @inspired_links = []
      @personal_links = []
      @sponsor_links = []

      @source_paths[:wares] = File.join(@source_paths[:root], 'data', 'gear')
      @source_paths[:links] = File.join(@source_paths[:root], 'data', 'links')

      @output_paths[:api] = { root: File.join(@output_paths[:site], 'api', "v#{API_VERSION}") }

      %w(interviews hardware software categories stats).each do |item|
        path = File.join(@output_paths[:api][:root], item)
        @output_paths[:api][item.to_sym] = path
      end

      @stats = { hardware: { all: [], years: {} }, software: { all: [], years: {} } }
      @api_data = { interviews: [], hardware: [], software: [], categories: [] }

      @post_class = UsesThis::Interview
    end

    def prepare_output_directory
      super

      @output_paths[:api].each_value do |path|
        FileUtils.mkdir_p(path)
      end
    end

    def scan_files
      redis_connection.smembers(REDIS_STATS_KEY).each do |key|
        redis_connection.del(key)
      end

      scan_gear
      scan_links

      super
    end

    def scan_gear
      %w(hardware software).each do |type|
        Dir.glob(File.join(@source_paths[:wares], type, '*.yml')).each do |path|
          ware = UsesThis::Ware.new(path)
          send(type)[ware.slug] = ware
        end
      end
    end

    def scan_links
      %w(inspired personal sponsor).each do |type|
        Dir.glob(File.join(@source_paths[:links], type, '*.yml')).each do |path|
          send("#{type}_links") << UsesThis::Link.new(path)
        end
      end
    end

    def generate
      super

      generate_gear('hardware')
      generate_gear('software')

      generate_stats
    end

    def generate_posts
      super

      path = @output_paths[:api][:interviews]
      generate_api_file(path, interviews: @api_data[:interviews])
    end

    def generate_post(interview)
      super

      interview_hash = interview.to_h

      path = File.join(@output_paths[:api][:interviews], interview.slug)
      generate_api_file(path, interview: interview_hash)

      interview_hash.delete(:contents)
      interview_hash.delete(:gear)

      @api_data[:interviews] << interview_hash

      record_interview_stats(interview)
    end

    def generate_categories
      super

      path = @output_paths[:api][:categories]
      generate_api_file(path, categories: @api_data[:categories].sort!)
    end

    def generate_category(slug, category_interviews)
      super

      interviews = []

      category_interviews.each do |interview|
        interview_hash = interview.to_h

        interview_hash.delete(:contents)
        interview_hash.delete(:gear)

        interviews << interview_hash
      end

      path = File.join(@output_paths[:api][:categories], slug)
      generate_api_file(path, interviews: interviews)

      @api_data[:categories] << slug
    end

    def generate_gear(type)
      type_sym = type.to_sym
      gear = []

      send("#{type}").each_value do |ware|
        ware_hash = ware.to_h

        path = File.join(@output_paths[:api][type_sym], ware.slug)
        generate_api_file(path, gear: ware_hash)

        ware_hash.delete(:description)
        ware_hash.delete(:url)
        ware_hash.delete(:interviews)

        gear << ware_hash
      end

      generate_api_file(@output_paths[:api][type_sym], gear: gear)
    end

    def generate_stats
      %w(hardware software).each do |type|
        type_sym = type.to_sym

        @stats[type_sym][:all] = fetch_stats_by_key("#{type}:all")

        path = File.join(@output_paths[:api][:stats], type)

        FileUtils.mkdir(path)

        generate_api_file(path, gear: @stats[type_sym][:all])

        @archives[:year].keys.each do |year|
          @stats[type_sym][:years][year] = fetch_stats_by_key("#{type}:#{year}")

          year_path = File.join(path, year)

          FileUtils.mkdir(year_path)

          generate_api_file(year_path, gear: @stats[type_sym][:years][year])
        end

        all_stats = {
          interviews: @posts.count,
          hardware: @hardware.count,
          software: @software.count
        }

        generate_api_file(@output_paths[:api][:stats], all_stats)
      end
    end

    def generate_api_file(path, contents)
      file = @page_class.new(self)

      file.filename = 'index'
      file.extension = 'json'
      file.contents = Oj.dump(contents, indent: 2)

      file.write(path, false)
    end

    def record_interview_stats(interview)
      %w(hardware software).each do |type|
        interview.send(type).each_value do |item|
          send(type)[item.slug].interviews << interview

          keys = ["#{type}:all", "#{type}:#{interview.date.year}"]

          keys.each do |key|
            redis_connection.sadd(REDIS_STATS_KEY, key)
            redis_connection.zincrby(key, 1, item.slug)
          end
        end
      end
    end

    def fetch_stats_by_key(key, count = 50)
      result = []

      redis_connection.zrevrange(key, 0, count, withscores: true).each do |row|
        result << { slug: row[0], count: row[1].round }
      end

      result
    end

    def redis_connection
      @redis_connection ||= Redis.new
    end
  end
end
