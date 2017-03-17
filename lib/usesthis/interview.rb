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
      if @linked_contents.nil?
        @linked_contents = @contents.clone

        wares = @hardware.merge(@software)

        unless wares.empty?
          @linked_contents += "\n\n"

          links = []

          wares.each_value do |ware|
            links << "[#{ware.slug}]: #{ware.url} \"#{ware.description}\""
          end

          @linked_contents += links.join("\n")
        end
      end

      @linked_contents
    end

    def scan_links
      @contents.scan(/\[([^\[\(\)]+)\]\[([a-z0-9\.\-]+)?\]/).each do |link|
        slug = (link[1] ? link[1] : link[0].downcase)

        %w(hardware software).each do |type|
          if ware = @site.send(type)[slug]
            send(type)[slug] ||= ware.tap { |w| w.interviews << self }
          end
        end
      end
    end

    def to_h
      output = {
        slug: @slug,
        name: @title,
        url: "https://usesthis.com/interviews/#{@slug}/",
        summary: @summary,
        date: @date.to_i,
        categories: @categories,
        contents: @linked_contents,
        gear: { hardware: [], software: [] }
      }

      output[:credits] = @credits if @credits

      %w(hardware software).each do |type|
        type_sym = type.to_sym

        send(type).each_value do |ware|
          data = ware.to_h
          data.delete(:interviews)

          output[:gear][type_sym] << data
        end
      end

      output
    end
  end
end
