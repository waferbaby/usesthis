module UsesThis
  # A class that models a single interview.
  class Interview < Dimples::Post
    attr_accessor :hardware
    attr_accessor :software
    attr_accessor :credits

    def initialize(site, path)
      super

      @layout = 'interview'

      @hardware = {}
      @software = {}

      @credits = nil

      scan_links
    end

    def contents
      super + gear_links
    end

    def gear_links
      @gear_links ||= ''.tap do |links|
        gear = @hardware.merge(@software)

        unless gear.nil?
          links << "\n\n" << gear.map do |_, ware|
            "[#{ware.slug}]: #{ware.url} \"#{ware.description}\""
          end.join("\n")
        end
      end
    end

    def scan_links
      @contents.scan(/\[([^\[\(\)]+)\]\[([a-z0-9\.\-]+)?\]/).each do |link|
        slug = (link[1] ? link[1] : link[0].downcase)

        %w[hardware software].each do |type|
          ware = @site.send(type)[slug]
          send(type)[slug] ||= ware.tap { |w| w.interviews << self } if ware
        end
      end
    end

    def to_h
      @interview_hash ||= {
        slug: @slug,
        name: @title,
        url: "https://usesthis.com/interviews/#{@slug}/",
        summary: @summary,
        date: @date.to_i,
        categories: @categories,
        credits: @credits || '',
        contents: contents,
        gear: { hardware: [], software: [] }.tap do |gear|
          %w[hardware software].each do |type|
            send(type).each_value do |ware|
              gear[type.to_sym] << ware.to_h.reject { |k, _| k == :interviews }
            end
          end
        end
      }
    end
  end
end
