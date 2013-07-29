require 'rubygems'
require 'frontable'
require 'renderable'
require 'site'
require 'erubis'

module UsesThis
  class Template
    include Frontable
    include Renderable
    attr_accessor :slug, :metadata, :contents

    def initialize(path)
      @slug = File.basename(path, File.extname(path))
      @metadata, @contents = read_with_yaml(path)
    end
  end
end