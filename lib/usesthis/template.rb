require 'rubygems'
require 'tilt'

class Template
  attr_accessor :slug, :renderer, :parent

  def initialize(path, parent = nil)
    @renderer = Tilt.new(path)
    @slug = File.basename(path, File.extname(path))

    @parent = parent unless parent.nil?
  end

  def render(context, params, contents)
    output = @renderer.render(context, params) {
      contents
    }
    
    if parent
      output = parent.render(context, params, output) {
        output
      }
    end

    output
  end
end