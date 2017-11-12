module UsesThis
  module Api
    class CategoriesGenerator < BaseGenerator
      def generate
        categories = []

        @site.categories.keys.sort.each do |slug|
          category = @site.categories[slug]

          interviews = category.posts.map(&:to_h).map do |interview|
            interview.reject { |key,| [:contents, :gear, :credits].include?(key) }
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

        endpoint = Endpoint.new(path, categories, 'categories')
        endpoint.publish
      end
    end
  end
end