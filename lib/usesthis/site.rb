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

      @stats = { hardware: { all: [], years: {} }, software: { all: [], years: {} } }

      @post_class = UsesThis::Interview
    end

    def scan_files
      redis_connection.smembers(REDIS_STATS_KEY).each do |key|
        redis_connection.del(key)
      end

      scan_gear
      scan_links

      super

      prepare_stats
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

    def prepare_post(post)
      super

      %w(hardware software).each do |type|
        post.send(type).each_value do |item|
          send(type)[item.slug].interviews << post

          keys = ["#{type}:all", "#{type}:#{post.date.year}"]

          keys.each do |key|
            redis_connection.sadd(REDIS_STATS_KEY, key)
            redis_connection.zincrby(key, 1, item.slug)
          end
        end
      end
    end

    def prepare_stats
      %w(hardware software).each do |type|
        type_sym = type.to_sym

        @stats[type_sym][:all] = fetch_stats_by_key("#{type}:all")

        @archives[:year].keys.each do |year|
          @stats[type_sym][:years][year] = fetch_stats_by_key("#{type}:#{year}")
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
