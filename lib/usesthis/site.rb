# frozen_string_literal: true

module UsesThis
  # A class that generates the usesthis.com site.
  class Site < Dimples::Site
    attr_accessor :hardware
    attr_accessor :software

    def initialize(config = {})
      super

      @hardware = {}
      @software = {}

      @source_paths[:wares] = File.join(@source_paths[:root], 'gear')
    end

    def scan_files
      scan_gear
      super
    end

    def scan_gear
      %w[hardware software].each do |type|
        type_path = File.join(@source_paths[:wares], type, '**', '*.json')
        Dir.glob(type_path).each do |path|
          ware = case type
                 when 'hardware'
                   UsesThis::Hardware.new(path)
                 when 'software'
                   UsesThis::Software.new(path)
                 end

          send(type)[ware.slug] = ware
        end
      end
    end

    def generate
      super
      UsesThis::API.generate(self)
    end

    def generate_posts
      super

      errors_path = File.join(@source_paths[:root], 'errors', '*.markdown')

      Dir.glob(errors_path) do |path|
        page = @post_class.new(self, path)

        page.output_directory = @output_paths[:site]
        page.filename = page.slug
        page.layout = 'interview'

        page.write
      end
    end
  end
end
