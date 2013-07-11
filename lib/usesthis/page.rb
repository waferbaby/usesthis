$:.unshift(__dir__)

require 'rubygems'
require 'erubis'

module UsesThis
  class Page
    include Frontable
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

    def write(output_path)
      if @path
        path = File.join(output_path, File.dirname(@path).gsub(@site.paths[:pages], ''), 'index.html')
      else
        path = File.join(output_path, 'index.html')
      end

      FileUtils.mkdir_p(File.dirname(path))

      File.open(path, 'w') do |file|
        begin
          @metadata['site'] = @site

          output = Erubis::Eruby.new(@contents).result(@metadata)
          output = @site.templates[@metadata['layout']].render(@metadata, output) if @metadata['layout']
        rescue
          output = @contents
        end

        file.write(output)
      end
    end
  end
end