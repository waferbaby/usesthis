$:.unshift(__dir__)

require 'rubygems'
require 'fileutils'
require 'frontable'
require 'kramdown'
require 'yaml'

module UsesThis
  class Interview
    include Frontable
    attr_accessor :site, :slug, :date, :name, :summary, :credits, :template, :categories, :wares
    attr_writer :answers

    def initialize(site, path)
      parts = File.basename(path, File.extname(path)).match(/(\d{4})-(\d{2})-(\d{2})-(.+)/)

      @site = site
      @slug = parts[4]
      @date = Time.mktime(parts[1], parts[2], parts[3])
      
      @wares = []

      metadata, @answers = read_with_yaml(path)

      %w(name summary categories credits).each do |item|
        self.send("#{item}=", metadata[item])
      end
    end

    def write(output_path)
      path = File.join(output_path, @slug, 'index.html')

      FileUtils.mkdir_p(File.dirname(path))

      params = {
        title: @name,
        interview: self
      }
      
      File.open(path, 'w') do |file|
        file.write(@site.templates['interview'].render(params, self.to_markdown))
      end
    end

    def answers
      output = @answers

      @answers.scan(/\[([^\[\(\)]+)\]\[([a-z0-9\.\-]+)?\]/).each do |link|
          slug = (link[1] ? link[1] : link[0].downcase)
          @wares.push(@site.wares[slug]) if @site.wares[slug]
        end

      if @wares.length > 0
        output += "\n\n"

        @wares.each do |ware|
          output += "[#{ware.slug}]: #{ware.url} \"#{ware.description}\"\n"
        end
      end

      output
    end

    def to_markdown
      Kramdown::Document.new(self.answers, auto_ids: false).to_html
    end
  end
end