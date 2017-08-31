# frozen_string_literal: true

module UsesThis
  # A module that generates a static API.
  module API
    VERSION = 1

    class << self
      include Dimples::Pagination

      def generate(site)
        @site = site
        @output_paths = {}
        @stats = {
          hardware: { all: Hash.new(0) },
          software: { all: Hash.new(0) }
        }

        base_path = File.join(@site.output_paths[:site], 'api')

        %w[interviews hardware software categories stats].each do |item|
          @output_paths[item.to_sym] = File.join(base_path, item)
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

        @site.posts.each do |interview|
          path = File.join(@output_paths[:interviews], interview.slug)
          publish_json_file(path, 'interview', interview: interview)
        end

        paginate_json(@site.posts, @output_paths[:interviews], 'interviews')
      end

      def generate_categories
        if @site.config['verbose_logging']
          Dimples.logger.debug_generation('categories', @site.categories.length)
        end

        @site.categories.each_value do |category|
          path = File.join(@output_paths[:categories], category.slug)
          paginate_json(category.posts, path, 'interviews')
        end

        categories = @site.categories.keys.sort!
        publish_json_file(@output_paths[:categories], 'categories', categories: categories)
      end

      def generate_gear
        %i[hardware software].each do |type|
          wares = @site.send(type)

          if @site.config['verbose_logging']
            Dimples.logger.debug_generation(type, wares.length)
          end

          wares.each_value do |ware|
            record_gear_stats(ware)

            path = File.join(@output_paths[type], ware.slug)
            publish_json_file(path, 'ware', ware: ware)
          end

          paginate_json(wares.values, @output_paths[type], 'wares')
        end
      end

      def generate_stats
        if @site.config['verbose_logging']
          Dimples.logger.debug('Calculating stats...')
        end

        %w[hardware software].each do |type|
          @stats[type.to_sym].each do |key, values|
            stats = values.sort_by(&:last).reverse[0..49].to_h
            output = stats.map do |slug, count|
              {
                ware: @site.send(type.to_sym)[slug],
                count: count
              }
            end

            parts = [@output_paths[:stats], type]
            parts << key.to_s unless key == :all

            publish_json_file(File.join(parts), 'gear_stats', stats: output)
          end
        end
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

      def publish_json_file(path, layout, context = {})
        file = Dimples::Page.new(@site)

        file.output_directory = path
        file.layout = "api.#{layout}"
        file.extension = 'json'

        file.write(context)
      end

      def paginate_json(items, path, layout)
        options = {
          extension: 'json',
          page_prefix: '?page='
        }

        paginate(@site, items, path, "api.#{layout}", options)
      end

      def templates
        @templates ||= @site.templates.keys.select { |k| k =~ /^api\./ }
      end
    end
  end
end
