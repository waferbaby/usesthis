module Jekyll

  class DatePage < Page

    def initialize(site, base, dir, title, posts)

      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'interview_date.html')

      self.data['title'] = title
      self.data['posts_by_date'] = posts
    end
  end

  class DateIndexPage < Page

    def initialize(site, base, dir, archives)

      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'interview_index.html')

      self.data['archives'] = archives
    end
  end

  class DatePageGenerator < Generator

    safe true

    def generate(site)
      archives = {}

      site.posts.reverse.each do |post|

        year = post.date.year
        month = post.date.strftime('%m')

        archives[year] ||= {}
        (archives[year][month] ||= []) << post
      end

      archives.each_pair do |year, archive|

        year_posts = []

        archive.each_pair do |month, posts|
          year_posts.concat(posts)
          site.pages << DatePage.new(site, site.source, File.join('interviews', year.to_s, month.to_s), "#{posts[0].date.strftime('%B')}, #{year}", posts)
        end

        site.pages << DatePage.new(site, site.source, File.join('interviews', year.to_s), year, year_posts)
      end

      site.pages << DateIndexPage.new(site, site.source, 'interviews', archives)
    end
  end
end
