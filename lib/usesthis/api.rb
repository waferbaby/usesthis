module UsesThis
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

        %w(interviews hardware software categories stats).each do |item|
          @output_paths[item.to_sym] = File.join(root_path, item)
        end

        Dimples.logger.info("Building API...")

        generate_interviews
        generate_categories
        generate_gear
        generate_stats

        Dimples.logger.info("API built!")
      end

      def generate_interviews
        Dimples.logger.debug_generation('interviews', @site.posts.length) if @site.config['verbose_logging']

        interview_data = []

        @site.posts.each do |interview|
          data = interview.to_h

          path = File.join(@output_paths[:interviews], interview.slug)
          write_json_file(path, interview: data)

          %i(contents gear).each { |key| data.delete(key) }
          interview_data << data
        end

        write_json_file(@output_paths[:interviews], interviews: interview_data)
      end

      def generate_categories
        Dimples.logger.debug_generation('categories', @site.categories.length) if @site.config['verbose_logging']

        categories = @site.categories.keys.sort!

        @site.categories.each_value do |category|
          interview_data = []

          category.posts.each do |interview|
            interview_data << interview.to_h.tap do |h|
              h.delete(:contents)
              h.delete(:gear)
            end
          end

          path = File.join(@output_paths[:categories], category.slug)
          write_json_file(path, interviews: interview_data)
        end

        write_json_file(@output_paths[:categories], categories: categories)
      end

      def generate_gear
        %w(hardware software).each do |type|
          gear_items = @site.send(type)
          type_sym = type.to_sym
          gear_data = []

          Dimples.logger.debug_generation(type, gear_items.length) if @site.config['verbose_logging']

          gear_items.each_value do |ware|
            data = ware.to_h

            path = File.join(@output_paths[type_sym], ware.slug)
            write_json_file(path, gear: data)

            @stats[type_sym][:all][ware.slug] = ware.interviews.count

            ware.interviews.each do |interview|
              year_sym = interview.year.to_sym

              @stats[type_sym][year_sym] ||= Hash.new(0)
              @stats[type_sym][year_sym][ware.slug] += 1
            end

            %i(description url interviews).each { |key| data.delete(key) }

            gear_data << data
          end

          write_json_file(@output_paths[type_sym], gear: gear_data)
        end
      end

      def generate_stats
        Dimples.logger.debug("Calculating stats...") if @site.config['verbose_logging']

        %w(hardware software).each do |type|
          @stats[type.to_sym].each do |key, values|
            stats = values.sort_by(&:last).reverse[0..49].to_h
            data = stats.map { |key, value| { slug: key, count: value } }

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

      def write_json_file(path, contents)
        file = @site.page_class.new(@site)

        file.filename = 'index'
        file.extension = 'json'
        file.contents = Oj.dump(contents, indent: 2)

        file.write(file.output_path(path), false)
      end
    end
  end
end