module UsesThis
  class Site < Salt::Site

    attr_accessor :wares, :links

    def setup(config = {})

      @settings[:markdown_options][:auto_ids] = false
      @settings[:output][:posts] = 'interviews'
      @settings[:archives] = {
        years: '%Y',
        months: '%B %Y',
        days: false,
        layout: 'interviews'
      }

      super

      @output_paths[:wares] = File.join(@source_paths[:root], 'data', 'wares')
      @output_paths[:links] = File.join(@source_paths[:root], 'data', 'links')

      @wares, @links = {}, { personal: [], inspired: [] }
    end

    def scan_files
      super

      Dir.glob(File.join(@output_paths[:wares], '**', '*.yml')).each do |path|
        ware = UsesThis::Ware.new(path)
        @wares[ware.slug] = ware
      end

      Dir.glob(File.join(@output_paths[:links], '**', '*.yml')).each do |path|
        link = UsesThis::Link.new(path)
        @links[link.summary ? :inspired : :personal] << link
      end

      @posts.each do |post|
        post.scan_links
      end
    end
  end
end