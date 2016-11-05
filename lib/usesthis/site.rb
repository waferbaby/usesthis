module UsesThis
  class Site < Dimples::Site
    attr_accessor :hardware
    attr_accessor :software
    attr_accessor :inspired_links
    attr_accessor :personal_links
    attr_accessor :sponsor_links
    attr_accessor :stats

    def initialize(config = {})
      super

      @hardware = {}
      @software = {}

      @inspired_links = []
      @personal_links = []
      @sponsor_links = []

      @source_paths[:wares] = File.join(@source_paths[:root], 'gear')
      @source_paths[:links] = File.join(@source_paths[:root], 'links')

      @post_class = UsesThis::Interview
    end

    def scan_files
      scan_gear
      scan_links

      super
    end

    def scan_gear
      %w(hardware software).each do |type|
        Dir.glob(File.join(@source_paths[:wares], type, '*.yml')).each do |path|
          ware = UsesThis::Ware.new(path)
          send(type)[ware.slug] = ware
        end
      end
    end

    def scan_links
      %w(inspired personal sponsor).each do |type|
        Dir.glob(File.join(@source_paths[:links], type, '*.yml')).each do |path|
          send("#{type}_links") << UsesThis::Link.new(path)
        end
      end
    end

    def generate_posts
      super

      Dir.glob(File.join(@source_paths[:root], 'errors', '*.markdown')) do |path|
        page = @post_class.new(self, path)

        page.filename = File.basename(path, '.markdown')
        page.layout = 'interview'

        page.write(File.join(@output_paths[:site], "#{page.slug}.html"))
      end
    end
  end
end
