module UsesThis
  # A module that generates a static API.
  module API
    VERSION = 1

    class << self
      def generate(site)
        @site = site
        @output_paths = {}
        @stats = {
          hardware: { all: Hash.new(0) },
          software: { all: Hash.new(0) }
        }

        root_path = File.join(@site.output_paths[:site], 'api')

        %w[interviews hardware software categories stats].each do |item|
          @output_paths[item.to_sym] = File.join(root_path, item)
        end

        generate_interviews
        generate_categories
        generate_gear
        generate_stats
      end

      def generate_interviews
        if @site.config['verbose_logging']
          Dimples.logger.debug_generation('interviews', @site.posts.length)
        end

        interviews_data = []

        @site.posts.each do |interview|
          data = interview.to_h

          path = File.join(@output_paths[:interviews], interview.slug)
          write_json_file(path, interview: data)

          %i[contents gear].each { |key| data.delete(key) }
          interviews_data << data
        end

        write_json_file(@output_paths[:interviews], interviews: interviews_data)
      end

      def generate_categories
        if @site.config['verbose_logging']
          Dimples.logger.debug_generation('categories', @site.categories.length)
        end

        @site.categories.each_value do |category|
          interviews_data = []

          category.posts.each do |interview|
            data = interview.to_h.reject do |k, _|
              %i[contents gear].include?(k)
            end

            interviews_data << data
          end

          path = File.join(@output_paths[:categories], category.slug)
          write_json_file(path, interviews: interviews_data)
        end

        categories = @site.categories.keys.sort!
        write_json_file(@output_paths[:categories], categories: categories)
      end

      def generate_gear
        %i[hardware software].each do |type|
          gear = @site.send(type)
          gear_data = []

          if @site.config['verbose_logging']
            Dimples.logger.debug_generation(type, gear.length)
          end

          gear.each_value do |ware|
            data = ware.to_h
            path = File.join(@output_paths[type], ware.slug)

            write_json_file(path, gear: data)
            record_gear_stats(ware)

            gear_data << data.select { |k, _| %i[slug name].include?(k) }
          end

          write_json_file(@output_paths[type.to_sym], gear: gear_data)
        end
      end

      def generate_stats
        if @site.config['verbose_logging']
          Dimples.logger.debug('Calculating stats...')
        end

        %w[hardware software].each do |type|
          @stats[type.to_sym].each do |key, values|
            stats = values.sort_by(&:last).reverse[0..49].to_h
            data = stats.map { |slug, count| { slug: slug, count: count } }

            parts = [@output_paths[:stats], type]
            parts << key.to_s unless key == :all

            write_json_file(File.join(parts), gear: data)
          end
        end

        general_stats = {
          interviews: @site.posts.count,
          hardware: @site.hardware.count,
          software: @site.software.count
        }

        write_json_file(@output_paths[:stats], general_stats)
      end

      def record_gear_stats(ware)
        type_sym = ware.is_a?(UsesThis::Hardware) ? :hardware : :software

        @stats[type_sym][:all][ware.slug] = ware.interviews.count

        ware.interviews.each do |interview|
          year_sym = interview.year.to_sym

          @stats[type_sym][year_sym] ||= Hash.new(0)
          @stats[type_sym][year_sym][ware.slug] += 1
        end
      end

      def write_json_file(path, contents)
        file = @site.page_class.new(@site)

        file.filename = 'index'
        file.extension = 'json'
        file.contents = JSON.pretty_generate(contents, indent: '  ', space: ' ')

        file.write(file.output_path(path), false)
      end
    end
  end
end
