$:.unshift(__dir__)

require 'rubygems'

module UsesThis
  class Page
    include Frontable
    attr_accessor :site, :metadata, :contents

    def initialize(site, path = nil)
      @site = site
      @metadata, @contents = path ? read_with_yaml(path) : {}, ''
    end

    def write(output_path)
      path = File.join(output_path, 'index.html')

      FileUtils.mkdir_p(File.dirname(path))
      
      File.open(path, 'w') do |file|
        file.write(@site.templates[@metadata[:layout]].render(@metadata, @contents))
      end
    end
  end
end