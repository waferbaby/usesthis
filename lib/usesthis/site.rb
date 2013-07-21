$:.unshift(__dir__)

require 'rubygems'
require 'fileutils'
require 'interview'
require 'link'
require 'ware'

module UsesThis
  class Site
    
    attr_accessor :paths, :interviews, :archives, :wares, :pages, :links, :templates, :categories

    def initialize(path)
      @paths = {
        source: path,
        output: File.join(path, 'site'),
        data: File.join(path, 'data'),
        pages: File.join(path, 'pages'),
        assets: File.join(path, 'public'),
        templates: File.join(path, 'templates')
      }

      self.scan
    end

    def scan
      @templates = {}

      Dir.glob(File.join(@paths[:source], 'templates', '*.erb')).each do |path|
        template = Template.new(self, path)
        @templates[template.slug] = template
      end

      @pages = []

      Dir.glob(File.join(@paths[:source], 'pages', '**', '*.*')).each do |path|
        page = Page.new(self, path)
        @pages.push(page)
      end

      @wares = {}

      Dir.glob(File.join(@paths[:data], '{hardware,software}', '*.yml')).each do |path|
        ware = Ware.new(path)
        @wares[ware.slug] = ware
      end

      @links = {
        personal: [],
        inspired: [],
      }

      Dir.glob(File.join(@paths[:data], 'links', '**', '*.yml')).each do |path|
        link = Link.new(path)

        if File.dirname(path) =~ /personal/
          @links[:personal].push(link)
        else
          @links[:inspired].push(link)
        end
      end

      @interviews = []

      Dir.glob(File.join(@paths[:source], 'interviews', '*.*')).each do |path|
        interview = Interview.new(self, path)
        @interviews.push(interview)
      end

      @interviews.reverse!

      @categories = {}
      @archives = {}
      
      interviews.each do |interview|

        year = interview.date.year
        month = interview.date.strftime('%m')
        
        @archives[year] ||= {interviews: [], months: {}}
        @archives[year][:months][month] ||= []
        @archives[year][:interviews].push(interview)
        @archives[year][:months][month].push(interview)

        interview.categories.each do |category|
          (@categories[category] ||= []).push(interview)
        end
      end
    end

    def paginate(interviews, sub_paths = [], title = nil)
      per_page = 10
      pages = (interviews.length.to_f / per_page.to_i).ceil

      for index in 0...pages
        interview_range = interviews.slice(index * per_page, per_page)

        page = Page.new(self)

        paths = []
        paths.push(@paths[:output])

        if sub_paths.length > 0
          paths.concat(sub_paths)
          url_path = "/#{sub_paths.join('/')}/"
        else
          url_path = '/'
        end

        page_title = title

        if index == 0
          page_title = "Hello" if title.nil?
        else
          page_title = "Interviews" if title.nil?
          page_title += " (Page #{index + 1})"

          paths.push("page#{index + 1}")
        end

        pagination = {
          page: index + 1,
          pages: pages,
          total: interviews.length,
          path: url_path
        }

        if (pagination[:page] - 1) > 0
          pagination[:previous_page] = pagination[:page] - 1
        end

        if (pagination[:page] + 1) <= pagination[:pages]
          pagination[:next_page] = pagination[:page] + 1
        end

        page.metadata = {
          'layout' => 'interviews',
          'title' => page_title,
          'interviews' => interview_range,
          'pagination' => pagination
        }

        page.write(File.join(paths))
      end
    end

    def build
      STDOUT.sync = true
      start_time = Time.now

      puts "Building into #{@paths[:output]}:\n\n"

      print "- Preparing output directory... "

      begin
        if Dir.exists?(@paths[:output])
          FileUtils.rm_rf(File.join(@paths[:output], '*'))
        else
          Dir.mkdir(@paths[:output])
        end
      rescue Exception => e
        puts "Error: Failed to prepare the site directory (#{e})"
        return
      end

      puts "Done."
      print "- Generating interviews... "

      @interviews.each do |interview|
        begin
          interview.write(File.join(@paths[:output], 'interviews'))
        rescue Exception => e
          puts "Error: Failed to build the #{interview.name} interview (#{e})"
          return
        end
      end

      puts "Done."
      print "- Generating archive pages... "

      @archives.each do |year, data|
        data[:months].each do |month, interviews|
          begin
            self.paginate(interviews, ['interviews', year.to_s, month.to_s], interviews[0].date.strftime('%B %Y'))
          rescue Exception => e
            puts "Error: Failed to build the archives for #{year}, #{month} (#{e})"
            return
          end
        end

        begin
          self.paginate(data[:interviews], ['interviews', year.to_s], year.to_s)
        rescue
          puts "Error: Failed to build the archives for #{year} (#{e})"
          return
        end
      end

      puts "Done."
      print "- Generating main index pages... "

      begin
        self.paginate(@interviews)
      rescue Exception => e
        puts "Error: Failed to build the interview index pages (#{e})"
        return
      end

      puts "Done."
      print "- Generating category index pages... "
      
      @categories.each_pair do |slug, interviews|
        begin
          self.paginate(interviews, ['interviews', slug], slug.capitalize)
        rescue Exception => e
          puts "Error: Failed to build the #{slug.capitalize} interview index pages (#{e})"
          return
        end
      end

      puts "Done."
      print "- Generating pages... "

      @pages.each do |page|
        begin
          page.write(@paths[:output])
        rescue
          puts "Error: Failed to build the page at #{page.path} (#{e})"
          return
        end
      end

      puts "Done."
      print "- Generating feed... "

      feed = Page.new(self)

      feed.metadata = {
        'layout' => 'feed',
        'interviews' => @interviews[0..10]
      }

      begin
        feed.write(File.join(@paths[:output]), 'feed.xml')
      rescue Exception => e
        puts "Error: Failed to build the main feed (#{e})"
        return
      end

      puts "Done."
      print "- Copying assets... "

      begin
        FileUtils.cp_r(@paths[:assets] + "/.", @paths[:output])
      rescue Exception => e
        puts "Error: Failed to copy the site's assets (#{e})"
        return
      end

      end_time = Time.now
      build_time = end_time - start_time

      puts "Done."
      puts "\nCompleted (#{build_time.round} seconds)."
    end
  end
end