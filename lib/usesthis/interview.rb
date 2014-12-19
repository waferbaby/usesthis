require 'redcarpet'

module UsesThis
  class Interview < Salt::Post
    
    attr_accessor :hardware
    attr_accessor :software

    def initialize(site, path)
      super

      @layout = 'interview'

      @hardware = {}
      @software = {}

      @markdown = {
        rendered: false,
        raw: false,
      }
    end

    def type
      :interview
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
    
    def handle_wares(wares)
      wares = @hardware.merge(@software)
      output = @contents
        
      if wares.length > 0
        output += "\n\n"

        wares.each_value do |ware|
          output += "[#{ware.slug}]: #{ware.url} \"#{ware.description}\"\n"
        end
      end
    end

    def handle_raw_markdown
      unless @markdown[:raw]
        @markdown[:raw] = handle_wares
      end

      @markdown[:raw]
    end
    
    def handle_rendered_markdown
      unless @markdown[:rendered]
        output = @markdown[:raw]
        @markdown[:rendered] = @site.markdown_engine.render(output)
      end

      @markdown[:rendered]
    end
    
    def markdown(render = true)
      return handle_raw_markdown unless render
      handle_rendered_markdown
    end

    def output_path(parent_path)
      File.join(parent_path, @slug)
    end
    
    def wares_to_hash(data)
      wares = @hardware.merge(@software)

      if wares.length > 0
        data[:wares] = {}

        wares.each do |slug, ware|
          data[:wares][slug] = ware.to_hash
        end
      end
      
      data
    end

    def to_hash
      data = {
        name: @name,
        summary: @summary,
        date: @date,
        categories: @categories,
      }

      data[:credits] = credits if credits
      data[:contents] = @contents

      data = wares_to_hash(data)

      data
    end

    def to_markdown
      output = <<MARKDOWN
# Interview

![#{name}](http://usesthis.com/images/portraits/#{slug}.jpg)

## #{name}
#{summary} @ #{date}

MARKDOWN

      if credits
        output << "Photo by [#{credits['name']}](#{credits['url']})\n\n"
      end

      categories.each do |category|
        output << "- [#{category}](http://usesthis.com/interviews/#{category})\n"
      end

      output << "\n"
      output << markdown(false)

      output
    end
  end
end
