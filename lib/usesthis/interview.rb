require 'redcarpet'

module UsesThis
  class Interview < Salt::Post
    attr_accessor :wares

    def initialize(path)
      super

      @layout = 'interview'
      @wares = {}
    end

    def scan_links
      site = UsesThis::Site.instance

      @contents.scan(/\[([^\[\(\)]+)\]\[([a-z0-9\.\-]+)?\]/).each do |link|
        slug = (link[1] ? link[1] : link[0].downcase)
        @wares[slug] = site.wares[slug] if site.wares[slug] && @wares[slug].nil?
      end
    end

    def markdown
      if @markdown.nil?
        site = UsesThis::Site.instance
        output = @contents

        if @wares.length > 0
          output += "\n\n"

          @wares.each_value do |ware|
            output += "[#{ware.slug}]: #{ware.url} \"#{ware.description}\"\n"
          end
        end

        @markdown = site.markdown_renderer.render(output)
      end

      @markdown
    end

    def output_path(site, parent_path)
      File.join(parent_path, @slug)
    end
  end
end