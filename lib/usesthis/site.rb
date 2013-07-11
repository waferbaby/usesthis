$:.unshift(__dir__)

require 'rubygems'
require 'fileutils'
require 'interview'
require 'link'
require 'ware'

module UsesThis
  class Site
    
    attr_accessor :paths, :interviews, :wares, :pages, :links, :templates, :categories

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

      Dir.glob(File.join(@paths[:data], 'wares', '**', '*.*')).each do |path|
        ware = Ware.new(path)
        @wares[ware.slug] = ware
      end

      @interviews = []

      Dir.glob(File.join(@paths[:data], 'interviews', '*.*')).each do |path|
        interview = Interview.new(self, path)
        @interviews.push(interview)
      end

      @interviews.reverse!

      @categories = {}
      
      interviews.each do |interview|
        interview.categories.each do |category|
          (@categories[category] ||= []).push(interview)
        end
      end
    end

    def paginate(interviews, slug = nil)
      per_page = 10
      pages = (interviews.length.to_f / per_page.to_i).ceil

      for index in 0...pages
        interview_range = interviews.slice(index * per_page, per_page)

        page = Page.new(self)

        paths = []

        paths.push(@paths[:output])

        if slug
          paths.push('interviews')
          paths.push(slug)
        end

        if index == 0
          title = slug ? slug.capitalize : "Hello"  
        else
          title = slug ? slug.capitalize : "Interviews"
          title += " (Page #{index + 1})"

          paths.push("page#{index + 1}")
        end

        page.metadata = {
          'layout' => 'interviews',
          'title' => title,
          'interviews' => interview_range,
          'pagination' => {
            page: index + 1,
            pages: pages,
            total: interviews.length
          }
        }

        page.write(File.join(paths))
      end
    end

    def build
      if Dir.exists?(@paths[:output])
        FileUtils.rm_rf(Dir.glob(File.join(@paths[:output], '*')))
      else
        Dir.mkdir(@paths[:output])
      end

      @interviews.each do |interview|
        interview.write(File.join(@paths[:output], 'interviews'))
      end

      self.paginate(@interviews)
      
      @categories.each_pair do |slug, interviews|
        self.paginate(interviews, slug)
      end

      @pages.each do |page|
        page.write(@paths[:output])
      end

      FileUtils.cp_r(@paths[:assets] + "/.", @paths[:output])
    end
  end
end