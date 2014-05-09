require 'redcarpet'

module UsesThis
  class Interview < Salt::Post
    
    attr_accessor :hardware
    attr_accessor :software

    def initialize(path)
      super

      @layout = 'interview'

      @hardware = {}
      @software = {}

      @markdown = {
        rendered: false,
        raw: false,
      }
    end

    def scan_links
      site = UsesThis::Site.instance

      @contents.scan(/\[([^\[\(\)]+)\]\[([a-z0-9\.\-]+)?\]/).each do |link|
        slug = (link[1] ? link[1] : link[0].downcase)

        if site.hardware[slug]
          @hardware[slug] ||= site.hardware[slug]
        elsif site.software[slug]
          @software[slug] ||= site.software[slug]
        end
      end
    end

    def markdown(render = true)
      if !@markdown[:raw]
        wares = @hardware.merge(@software)
        output = @contents

        if wares.length > 0
          output += "\n\n"

          wares.each_value do |ware|
            output += "[#{ware.slug}]: #{ware.url} \"#{ware.description}\"\n"
          end
        end

        @markdown[:raw] = output
      end

      return @markdown[:raw] unless render

      if !@markdown[:rendered]
        site = UsesThis::Site.instance
        output = @markdown[:raw]

        @markdown[:rendered] = site.markdown_renderer.render(output)
      end

      @markdown[:rendered]
    end

    def output_path(site, parent_path)
      File.join(parent_path, @slug)
    end

    def to_hash
      data = {
        name: @name,
        summary: @summary,
        date: @date,
        categories: @categories,
        contents: @contents,
      }

      data[:wares] = {}

      @hardware.merge(@software).each do |slug, ware|
        data[:wares][slug] = ware.to_hash
      end

      data
    end

    def to_markdown
      output = <<MARKDOWN
# Interview

![#{name}](http://usesthis.com/images/portraits/#{slug}.jpg)

## #{name}
#{summary} @ #{date}

MARKDOWN

      categories.each do |category|
        output << "- #{category}\n"
      end

      output << "\n"
      output << markdown(false)

      output
    end
  end
end