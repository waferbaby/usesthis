$:.unshift(__dir__)

require 'rubygems'
require 'interview'
require 'link'
require 'ware'

class Site
  
  attr_accessor :paths, :interviews, :wares, :links, :categories

  def initialize(path)
    @paths = {
      source: path,
      output: File.join(path, 'site'),
      data: File.join(path, 'data'),
      assets: File.join(path, 'public'),
    }

    self.scan
  end

  def scan
    @wares = {}

    Dir.glob(File.join(@paths[:data], '*', '*.*')).each do |path|
      ware = Ware.new(path)
      @wares[ware.slug] = ware
    end

    @interviews = []

    Dir.glob(File.join(@paths[:data], 'interviews', '*.*')).each do |path|
      interview = Interview.new(path)

      interview.answers.scan(/\[([^\[\(\)]+)\]\[([a-z0-9\.\-]+)?\]/).each do |link|
        slug = (link[1] ? link[1] : link[0].downcase)
        interview.wares << @wares[slug] if @wares[slug]
      end

      @interviews << interview
    end

    @interviews.reverse!

    @categories = {}
    
    interviews.each do |interview|
      interview.categories.each do |category|
        (@categories[category] ||= []) << interview
      end
    end
  end

  def build
  end
end