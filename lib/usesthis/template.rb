require 'rubygems'
require 'frontable'
require 'tilt'

module UsesThis
  class Template
    include Frontable
    attr_accessor :site, :slug, :renderer, :metadata

    def initialize(site, path)
      @site = site
      @renderer = Tilt.new(path)
      @slug = File.basename(path, File.extname(path))

      @metadata, _ = read_with_yaml(path)
    end

    def render(context, params, contents)
      output = @renderer.render(context, params) {
        contents
      }

      if @metadata['layout'] && @site.templates[@metadata['layout']]
        output = @site.templates[@metadata['layout']].render(context, params, contents)
      end

      output
    end
  end
end