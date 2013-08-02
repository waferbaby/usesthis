$:.unshift(__dir__)

require 'rubygems'
require 'renderable'
require 'site'

module UsesThis
  class Page
    include Frontable
    include Renderable
    attr_accessor :metadata, :filename, :extension, :contents

    def initialize(path = nil)
      @path = path

      if path
        @metadata, @contents = read_with_yaml(path)
      else
        @metadata, @contents = {'title' => '', 'layout' => 'default'}, ''
      end
    end

    def write(output_path, filename = nil)
      if @path
        filename = (File.basename(@path, File.extname(@path)) + ".html") if filename.nil?
        output_path = File.join(output_path, File.dirname(@path).gsub(Site.instance.paths[:pages], ''))
      else
        filename = 'index.html' if filename.nil?
      end

      FileUtils.mkdir_p(output_path)

      File.open(File.join(output_path, filename), 'w') do |file|
          output = self.render(@metadata, @contents)
          file.write(output)
      end
    end
  end
end