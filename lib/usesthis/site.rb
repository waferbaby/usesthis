$:.unshift(__dir__)

require 'rubygems'
require 'fileutils'
require 'interview'
require 'link'
require 'ware'

module UsesThis
  class Site
    
    attr_accessor :paths, :interviews, :wares, :links, :templates, :categories

    def initialize(path)
      @paths = {
        source: path,
        output: File.join(path, 'site'),
        data: File.join(path, 'data'),
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

    def template(slug)
      @templates[slug] ? @templates[slug] : @templates['default']
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

      per_page = 10
      pages = (@interviews.length.to_f / per_page.to_i).ceil

      for index in 0...pages
        interviews = @interviews.slice(index * per_page, per_page)

        page = Page.new(self)

        page.metadata = {
          layout: 'interviews',
          title: '',
          interviews: interviews,
        }

        path = index == 0 ? @paths[:output] : File.join(@paths[:output], "page#{index + 1}")
        page.write(path)
      end
    end
  end
end