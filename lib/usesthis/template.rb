require 'rubygems'
require 'frontable'
require 'erubis'

module UsesThis
  class Template
    include Frontable
    attr_accessor :site, :slug, :metadata, :contents

    def initialize(site, path)
      @site = site
      @slug = File.basename(path, File.extname(path))

      @metadata, @contents = read_with_yaml(path)
    end

    def render(params = {}, body = '')
      params[:site] = @site

      output = Erubis::Eruby.new(@contents).result(params) {
        body
      }

      if @metadata['layout'] && @site.templates[@metadata['layout']]
        output = @site.templates[@metadata['layout']].render(params, output)
      end

      output
    end
  end
end