module UsesThis
  module Api
    class CategoriesGenerator < BaseGenerator
      def generate
        categories = []

        @site.categories.keys.sort.each do |key|
          category = @site.categories[key]

          interviews = category.posts.map(&:to_h).map do |interview|
            interview.clone.delete_if { |key,| [:contents, :gear].include?(key) }
          end

          path = File.join(@output_path, 'categories', category.slug)

          paginate('interviews', interviews, path)

          categories << {
            slug: category.slug,
            name: category.name,
            url: "https://usesthis.com/categories/#{category.slug}"
          }
        end

        path = File.join(@output_path, 'categories')
        json = build_json('categories', categories)

        publish_json_file(path, json)
      end
    end
  end
end