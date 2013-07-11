require 'rubygems'
require 'frontable'
require 'renderable'
require 'erubis'

module UsesThis
  class Template
    include Frontable
    include Renderable
    attr_accessor :site, :slug, :metadata, :contents

    def initialize(site, path)
      @site = site
      @slug = File.basename(path, File.extname(path))

      @metadata, @contents = read_with_yaml(path)
    end
  end
end