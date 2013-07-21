$:.unshift(__dir__)

require 'rubygems'
require 'renderable'

module UsesThis
  class Page
    include Frontable
    include Renderable
    attr_accessor :site, :metadata, :contents

    def initialize(site, path = nil)
      @site = site
      @path = path

      if path
        @metadata, @contents = read_with_yaml(path)
      else
        @metadata, @contents = {'title' => '', 'layout' => 'default'}, ''
      end
    end

    def write(output_path, filename = 'index.html')
      if @path
        path = File.join(output_path, File.dirname(@path).gsub(@site.paths[:pages], ''), filename)
      else
        path = File.join(output_path, filename)
      end

      FileUtils.mkdir_p(File.dirname(path))

      File.open(path, 'w') do |file|
          output = self.render(@metadata, @contents)
          file.write(output)
      end
    end
  end
end