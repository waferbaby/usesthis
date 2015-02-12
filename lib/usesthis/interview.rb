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
    end

    def type
      :interview
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

    def to_hash
      data = {
        name: @name,
        summary: @summary,
        date: @date,
        categories: @categories,
      }

      data[:credits] = credits if credits
      data[:contents] = @contents

      wares = @hardware.merge(@software)

      if wares.length > 0
        data[:wares] = {}

        wares.each do |slug, ware|
          data[:wares][slug] = ware.to_hash
        end
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

      if credits
        output += "Photo by [#{credits['name']}](#{credits['url']})\n\n"
      end

      categories.each do |category|
        output += "- [#{category}](http://usesthis.com/interviews/#{category})\n"
      end

      output += "\n"
      output += contents()

      output
    end
  end
end