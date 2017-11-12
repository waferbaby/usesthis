# frozen_string_literal: true

module UsesThis
  module Api
    # A class that generates all stats API endpoints.
    class StatsGenerator < BaseGenerator
      def generate
        %w[hardware software].each do |gear_type|
          gear_stats(gear_type).each do |stat_key, values|
            values = values.sort_by(&:last).reverse[0..49]

            items = values.map do |slug, count|
              item = @site.send(gear_type.to_sym)[slug].to_h
              item.delete_if { |key| key == :interviews }
              item.merge(count: count)
            end

            parts = [@output_path, 'stats', gear_type]
            parts << stat_key.to_s unless stat_key == :all

            Endpoint.publish(File.join(parts), items, 'wares')
          end

          stats = {
            slug: 'stats',
            interviews: @site.posts.count,
            hardware: @site.hardware.count,
            software: @site.software.count
          }

          path = File.join(@output_path, 'stats')
          Endpoint.publish(path, [stats], 'stats')
        end
      end

      def gear_stats(gear_type)
        {}.tap do |hash|
          hash[:all] = Hash.new(0)

          @site.send(gear_type.to_sym).each_value do |ware|
            hash[:all][ware.slug] = ware.interviews.count

            ware.interviews.each do |interview|
              (hash[interview.year.to_sym] ||= Hash.new(0))[ware.slug] += 1
            end
          end
        end
      end
    end
  end
end
