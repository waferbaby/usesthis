$:.unshift(__dir__)

require 'rubygems'
require 'template'
require 'erubis'

module UsesThis
  class Page < Template
    include Frontable

    def write(output_path)
      if @path
        path = File.join(output_path, File.dirname(@path).gsub(@site.paths[:pages], ''), 'index.html')
      else
        path = File.join(output_path, 'index.html')
      end

      FileUtils.mkdir_p(File.dirname(path))

      File.open(path, 'w') do |file|
        begin
          output = self.render(@metadata, @contents)
        rescue
          output = @contents
        end

        file.write(output)
      end
    end
  end
end