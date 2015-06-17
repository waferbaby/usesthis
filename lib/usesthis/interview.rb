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

        if @site.hardware[slug]
          @hardware[slug] ||= @site.hardware[slug]
          @site.hardware[slug].interviews << self
        elsif @site.software[slug]
          @software[slug] ||= @site.software[slug]
          @site.software[slug].interviews << self
        end
      end
    end

    def output_file_path(parent_path)
      File.join(parent_path, @slug, "#{@filename}.#{@extension}")
    end

    def to_h
      output = {
        slug: @slug,
        name: @name,
        url: "http://#{@slug}.usesthis.com/",
        summary: @summary,
        date: @date.to_i,
        categories: @categories.keys,
      }

      output[:credits] = @credits if @credits
      output[:contents] = @contents

      has_hardware = @hardware.length > 0
      has_software = @software.length > 0

      if has_hardware || has_software
        output[:gear] = {}

        output[:gear][:hardware] = [] if has_hardware
        output[:gear][:software] = [] if has_software

        %w{hardware software}.each do |type|
          self.send(type).each do |slug, ware|
            ware_hash = ware.to_h
            ware_hash.delete(:interviews)

            output[:gear][type.to_sym] << ware_hash
          end
        end
      end

      output
    end

    def self.next_date
      date = Time.now.to_date
      found_day = false

      while !found_day
        unless found_day = (date.strftime('%a') =~ /Tue|Thu/)
          date = date.next_day
        end
      end

      date
    end
  end
end