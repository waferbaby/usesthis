require 'json'
require 'json/ext'

module UsesThis
  class Interview < Dimples::Post
    
    attr_accessor :hardware
    attr_accessor :software

    def initialize(site, path)
      super

      @layout = 'interview'

      @hardware = {}
      @software = {}
    end

    def contents
      if @contents_with_links.nil?
        @contents_with_links = @contents.clone

        wares = @hardware.merge(@software)

        if wares.length > 0
          @contents_with_links += "\n\n"

          wares.each_value do |ware|
            @contents_with_links += "[#{ware.slug}]: #{ware.url} \"#{ware.description}\"\n"
          end
        end
      end

      @contents_with_links
    end

    def scan_links
      @contents.scan(/\[([^\[\(\)]+)\]\[([a-z0-9\.\-]+)?\]/).each do |link|
        slug = (link[1] ? link[1] : link[0].downcase)

        if @site.hardware[slug]
          @hardware[slug] ||= @site.hardware[slug]
        elsif @site.software[slug]
          @software[slug] ||= @site.software[slug]
        end
      end
    end

    def output_file_path(parent_path)
      File.join(parent_path, @slug, "#{@filename}.#{@extension}")
    end
  end
end