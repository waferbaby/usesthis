$:.unshift(__dir__)

require 'rubygems'

module UsesThis
  class Page
    include Frontable
    attr_accessor :site, :metadata, :contents

    def initialize(site, path = nil)
      @site = site

      if path
        @metadata, @contents = read_with_yaml(path)
      else
        @metadata, @contents = {}, ''
      end
    end

    def write(output_path)
      path = File.join(output_path, 'index.html')

      FileUtils.mkdir_p(File.dirname(path))

      File.open(path, 'w') do |file|
        file.write(@site.template(@metadata[:template]).render(@metadata))
      end
    end
  end
end