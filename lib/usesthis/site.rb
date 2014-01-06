module UsesThis
  class Site < Salt::Site

    attr_accessor :wares, :links

    def setup(path = nil, config = {})
      super

      @paths[:wares] = File.join(@paths[:source], 'data', 'wares')
      @paths[:links] = File.join(@paths[:source], 'data', 'links')

      @wares, @links = {}, { personal: [], inspired: [] }

      @settings[:markdown_options][:auto_ids] = false
    end

    def scan_files
      super

      Dir.glob(File.join(@paths[:wares], '**', '*.yml')).each do |path|
        ware = UsesThis::Ware.new(path)
        @wares[ware.slug] = ware
      end

      Dir.glob(File.join(@paths[:links], '**', '*.yml')).each do |path|
        link = UsesThis::Link.new(path)
        @links[link.summary ? :inspired : :personal] << link
      end

      @posts.each do |post|
        post.scan_links
      end
    end
  end
end