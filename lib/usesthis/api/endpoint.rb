module UsesThis
  module Api
    class Endpoint
      def initialize(output_path, items, type, pagination = false)
        @type = type
        @output_path = output_path
        @items = items
        @pagination = pagination
      end

      def build_json
        payload = Hash.new.tap do |hash|
          hash[:data] = @items.map do |item|
            {
              type: @type,
              id: item[:slug],
              attributes: item.reject { |key,| key == :slug }
            }
          end

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

        JSON.pretty_generate(payload)
      end

      def publish
        FileUtils.mkdir_p(@output_path) unless Dir.exist?(@output_path)
        File.write(File.join(@output_path, 'index.json'), build_json)
      end
    end
  end
end