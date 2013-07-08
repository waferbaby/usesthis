$:.unshift(__dir__)

require 'rubygems'
require 'fileutils'
require 'interview'
require 'link'
require 'ware'

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

    Dir.glob(File.join(@paths[:source], 'templates', '*.*')).each do |path|
      template = Template.new(path)
      @templates[template.slug] = template
    end

    @templates.each do |key, value|
      @templates[key].parent = @templates['default'] if key != 'default'
    end

    @wares = {}

    Dir.glob(File.join(@paths[:data], 'wares', '**', '*.*')).each do |path|
      ware = Ware.new(path)
      @wares[ware.slug] = ware
    end

    @interviews = []

    Dir.glob(File.join(@paths[:data], 'interviews', '*.*')).each do |path|
      interview = Interview.new(path)

      interview.answers.scan(/\[([^\[\(\)]+)\]\[([a-z0-9\.\-]+)?\]/).each do |link|
        slug = (link[1] ? link[1] : link[0].downcase)
        interview.wares.push(@wares[slug]) if @wares[slug]
      end

      interview.template = @templates['interview']

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

  def build
    if Dir.exists?(@paths[:output])
      FileUtils.rm_rf(Dir.glob(File.join(@paths[:output], '*')))
    else
      Dir.mkdir(@paths[:output])
    end

    @interviews.each do |interview|
      interview.write(File.join(@paths[:output], 'interviews'))
    end
  end
end