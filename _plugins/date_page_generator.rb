module Jekyll

	class DatePage < Page

		def initialize(site, base, dir, year, posts)

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

	class DateIndexPage < Page

		def initialize(site, base, dir, years)

			@site = site
			@base = base
			@dir = dir
			@name = 'index.html'

			self.process(@name)
			self.read_yaml(File.join(base, '_layouts'), 'interview_index.html')

			self.data['years'] = years
		end
	end

	class DatePageGenerator < Generator

		safe true

		def generate(site)
			years = {}

			site.posts.reverse.each do |post|
				(years[post.date.year] ||= []) << post
			end

			years.each_pair do |year, posts|
				site.pages << DatePage.new(site, site.source, File.join('interviews', year.to_s), year, posts)
			end

			site.pages << DateIndexPage.new(site, site.source, 'interviews', years)
		end
	end
end
