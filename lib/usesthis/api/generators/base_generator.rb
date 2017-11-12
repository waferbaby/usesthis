module UsesThis
  module Api
    class BaseGenerator
      def self.generate(site)
        new(site).generate
      end

      def initialize(site)
        @site = site
        @output_path = File.join(@site.output_paths[:site], 'api')
      end

      def publish_json_file(path, json_data)
        FileUtils.mkdir_p(path) unless Dir.exist?(path)
        File.write(File.join(path, 'index.json'), json_data)
      end

      def build_json(type, items, pagination = false)
        payload = Hash.new.tap do |hash|
          hash[:data] = items.map do |item|
            {
              type: type,
              id: item.delete(:slug),
              attributes: item
            }
          end

          if pagination
            hash[:meta] = {
              page_count: pagination[:page_count],
              item_count: pagination[:item_count]
            }

            hash[:links] = {
              self: pagination[:links][:current_page],
              first: pagination[:links][:first_page],
              last: pagination[:links][:last_page],
              prev: pagination[:links][:previous_page] || '',
              next: pagination[:links][:next_page] || ''
            }
          end
        end

        JSON.pretty_generate(payload)
      end

      def paginate(type, items, path)
        pager = Dimples::Pagination::Pager.new(
          path.sub(@site.output_paths[:site], '') + '/',
          items,
          50,
          page_prefix: '?page='
        )

        pager.each do |index, page_items|
          page_path = if index > 1
                        File.join(path, "page#{index}")
                      else
                        path
                      end

          publish_json_file(page_path, build_json(type, page_items, pager.to_h))
        end
      end
    end
  end
end