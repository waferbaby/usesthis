# frozen_string_literal: true

module UsesThis
  module Api
    # A class that generates all category API endpoints.
    class CategoriesGenerator < BaseGenerator
      def generate
        categories = []

        @site.categories.keys.sort.each do |slug|
          category = @site.categories[slug]

          interviews = category.posts.map(&:to_h).map do |interview|
            interview.reject { |key,| %i[contents gear credits].include?(key) }
          end

          path = File.join(@output_path, 'categories', category.slug)

          paginate(interviews, 'interviews', path)

          categories << {
            slug: category.slug,
            name: category.name,
            url: "https://usesthis.com/categories/#{category.slug}"
          }
        end

        path = File.join(@output_path, 'categories')
        Endpoint.publish(path, categories, 'categories')
      end
    end
  end
end
