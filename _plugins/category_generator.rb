module Jekyll
	class CategoryIndex < Page
		def initialize(site, base, dir, category)
			@site = site
			@base = base
			@dir = dir
			@name = 'index.html'

			self.process(@name)
			self.read_yaml(File.join(base, '_layouts'), 'category.html')
			self.data['category'] = category
		end
	end

	class CategoryGenerator < Generator
		safe true

		def generate(site)
			if site.layouts.key? 'category'
				site.categories.keys.each do |category|
					index = CategoryIndex.new(site, site.source, File.join('interviews', category), category)
					index.render(site.layouts, site.site_payload)
					index.write(site.dest)
					site.pages << index
				end
			end
		end
	end
end