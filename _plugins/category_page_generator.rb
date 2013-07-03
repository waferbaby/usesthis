module Jekyll

  class CategoryPage < Page

    def initialize(site, base, dir, category)

      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'interview_category.html')

      self.data['category'] = category
      self.data['title'] = category.capitalize
    end
  end

  class CategoryPageGenerator < Generator

    safe true

    def generate(site)
      site.categories.keys.each do |category|
        site.pages << CategoryPage.new(site, site.source, File.join('interviews', category), category)
      end
    end
  end
end
