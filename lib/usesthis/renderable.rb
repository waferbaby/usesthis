require 'rubygems'
require 'yaml'

module UsesThis
  module Renderable
    def render(params = {}, body = '')
        params['site'] ||= @site

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