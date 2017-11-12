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

      def paginate(items, type, path)
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

          endpoint = Endpoint.new(page_path, page_items, type, pager.to_h)
          endpoint.publish
        end
      end
    end
  end
end