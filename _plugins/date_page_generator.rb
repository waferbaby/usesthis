module Jekyll

	class DatePage < Page

		def initialize(site, base, dir, posts, year)

			@site = site
			@base = base
			@dir = dir
			@name = 'index.html'

			self.process(@name)
			self.read_yaml(File.join(base, '_layouts'), 'interview_date.html')

			self.data['title'] = "In #{year}"
			self.data['year_posts'] = posts
		end
	end

	class DatePageGenerator < Generator

		safe true

		def generate(site)
			years = {}

			site.posts.each do |post|
				(years[post.date.year] ||= []) << post
			end

			years.each_pair do |year, posts|
				site.pages << DatePage.new(site, site.source, File.join('interviews', year.to_s), posts.reverse, year)
			end
		end
	end
end