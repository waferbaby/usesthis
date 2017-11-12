# frozen_string_literal: true

module UsesThis
  module Api
    # A base class that models a single API generator.
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

          Endpoint.publish(page_path, page_items, type, pager.to_h)
        end
      end
    end
  end
end
