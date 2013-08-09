require 'rubygems'
require 'erubis'
require 'site'

module UsesThis
  module Renderable
    def render(params = {}, body = '')
        params['site'] ||= Site.instance

        output = Erubis::Eruby.new(@contents).evaluate(params) {
          body
        }

        if @metadata['layout'] && Site.instance.templates[@metadata['layout']]
          output = Site.instance.templates[@metadata['layout']].render(params, output)
        end

        output
      end
  end
end