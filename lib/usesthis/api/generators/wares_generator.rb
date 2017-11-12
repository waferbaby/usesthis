# frozen_string_literal: true

module UsesThis
  module Api
    # A class that generates all gear API endpoints.
    class WaresGenerator < BaseGenerator
      def generate
        %w[hardware software].each do |gear_type|
          wares = @site.send(gear_type.to_sym).map { |_, gear| gear.to_h }

          wares.each do |ware|
            path = File.join(@output_path, gear_type, ware[:slug])
            Endpoint.publish(path, [ware], 'wares')
          end

          wares.map! { |ware| ware.reject { |key,| key == :interviews } }

          path = File.join(@output_path, gear_type)
          paginate(wares, 'wares', path)
        end
      end
    end
  end
end
