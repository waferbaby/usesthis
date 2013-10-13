require 'kramdown'

module UsesThis
  class Interview < Salt::Post

    def self.path
      "interviews"
    end

    def initialize(path)
      super

      @layout = 'interview'
      @wares = {}
      @markdown_contents = nil
    end

    def scan_links
      site = UsesThis::Site.instance

      @contents.scan(/\[([^\[\(\)]+)\]\[([a-z0-9\.\-]+)?\]/).each do |link|
        slug = (link[1] ? link[1] : link[0].downcase)
        @wares[slug] = site.wares[slug] if site.wares[slug] && @wares[slug].nil?
      end
    end

    def contents
      if @markdown.nil?
        output = @contents

        if @wares.length > 0
          output += "\n\n"

          @wares.each_value do |ware|
            output += "[#{ware.slug}]: #{ware.url} \"#{ware.description}\"\n"
          end
        end

        @markdown = Kramdown::Document.new(output, auto_ids: false).to_html
      end

      @markdown
    end
  end
end