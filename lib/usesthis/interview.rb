# frozen_string_literal: true

module UsesThis
  # A class that models a single interview.
  class Interview < Dimples::Post
    attr_accessor :hardware
    attr_accessor :software
    attr_accessor :credits
    attr_accessor :license

    def initialize(site, path)
      super

      @layout = 'interview'

      @hardware = {}
      @software = {}

      scan_links
    end

    def contents
      super + "\n\n" + gear_links
    end

    def gear_links
      @gear_links ||= @hardware.merge(@software)&.map do |_, ware|
        "[#{ware.slug}]: #{ware.url} \"#{ware.description}\""
      end.join("\n")
    end

    def scan_links
      @contents.scan(/\[([^\[\(\)]+)\]\[([a-z0-9\.\-]+)?\]/).each do |link|
        slug = (link[1] ? link[1] : link[0].downcase)

        %w[hardware software].each do |type|
          if (ware = @site.send(type)[slug])
            send(type)[slug] ||= ware.tap { |w| w.interviews << self }
          end
        end
      end
    end

    def to_h
      @interview_hash ||= {
        slug: slug,
        name: title,
        summary: summary,
        date: date.xmlschema,
        categories: categories,
        credits: credits || '',
        contents: contents,
        gear: {}.tap do |gear|
          %w[hardware software].each do |type|
            gear[type.to_sym] = send(type).map do |_, ware|
              {
                slug: ware.slug,
                name: ware.name
              }
            end
          end
        end
      }
    end
  end
end
