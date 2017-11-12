# frozen_string_literal: true

module UsesThis
  module Api
    # A class that models a static API endpoint.
    class Endpoint
      def self.publish(output_path, items, type, pagination = false)
        new(output_path, items, type, pagination).publish
      end

      def initialize(output_path, items, type, pagination = false)
        @type = type
        @output_path = output_path
        @items = items
        @pagination = pagination
      end

      def build_payload
        {}.tap do |hash|
          hash[:data] = @items.map { |item| build_item(item) }

          if @pagination
            hash[:meta] = {
              page_count: @pagination[:page_count],
              item_count: @pagination[:item_count]
            }

            hash[:links] = {
              self: @pagination[:links][:current_page],
              first: @pagination[:links][:first_page],
              last: @pagination[:links][:last_page],
              prev: @pagination[:links][:previous_page] || '',
              next: @pagination[:links][:next_page] || ''
            }
          end
        end
      end

      def build_item(item)
        {
          type: @type,
          id: item[:slug],
          attributes: item.reject { |key,| key == :slug }
        }
      end

      def publish
        FileUtils.mkdir_p(@output_path) unless Dir.exist?(@output_path)

        json = JSON.pretty_generate(build_payload)
        File.write(File.join(@output_path, 'index.json'), json)
      end
    end
  end
end
