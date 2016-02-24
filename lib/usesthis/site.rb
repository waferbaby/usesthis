module UsesThis
  class Site < Dimples::Site
    attr_accessor :hardware
    attr_accessor :software
    attr_accessor :inspired_links
    attr_accessor :personal_links
    attr_accessor :sponsor_links

    def initialize(config = {})
      super

      @hardware = {}
      @software = {}

      @inspired_links = []
      @personal_links = []
      @sponsor_links = []

      @output_paths[:wares] = File.join(@source_paths[:root], 'data', 'gear')
      @output_paths[:links] = File.join(@source_paths[:root], 'data', 'links')

      @post_class = UsesThis::Interview
    end

    def scan_files
      %w[hardware software].each do |type|
        Dir.glob(File.join(@output_paths[:wares], type, '*.yml')).each do |path|
          ware = UsesThis::Ware.new(path)
          self.send(type)[ware.slug] = ware
        end
      end

      %w[inspired personal sponsor].each do |type|
        Dir.glob(File.join(@output_paths[:links], type, '*.yml')).each do |path|
          self.send("#{type}_links") << UsesThis::Link.new(path)
        end
      end

      super
    end

    def prepare_post(post)
      super

      %w[hardware software].each do |type|
        post.send(type).each_value do |item|
          self.send(type)[item.slug].interviews << post
        end
      end
    end
  end
end