module UsesThis
  class Interview < Dimples::Post
    attr_accessor :hardware
    attr_accessor :software

    def initialize(site, path)
      super

      @layout = 'interview'

      @hardware = {}
      @software = {}

      scan_links
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

        @hardware[slug] ||= @site.hardware[slug] if @site.hardware[slug]
        @software[slug] ||= @site.software[slug] if @site.software[slug]
      end
    end

    def to_h
      output = {
        slug: @slug,
        name: @title,
        url: "http://usesthis.com/interviews/#{@slug}/",
        summary: @summary,
        date: @date.to_i,
        categories: @categories,
      }

      output[:credits] = @credits if @credits
      output[:contents] = @contents

      output[:gear] = {
        hardware: [],
        software: []
      }

      %w{hardware software}.each do |type|
        self.send(type).each do |slug, ware|
          ware_hash = ware.to_h
          ware_hash.delete(:interviews)

          output[:gear][type.to_sym] << ware_hash
        end
      end

      output
    end
  end
end