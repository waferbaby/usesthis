module UsesThis
  class Site < Salt::Site

    attr_accessor :hardware
    attr_accessor :software
    attr_accessor :inspired_links
    attr_accessor :personal_links

    def setup(config = {})

      @settings[:markdown_options][:auto_ids] = false

      @settings[:make_day_archives] = false;
      @settings[:date_formats][:month] = '%B %Y';

      @settings[:output][:posts] = 'interviews'
      @settings[:layouts][:listing] = 'interviews';
      @settings[:layouts][:category] = 'interviews';

      super

      @output_paths[:wares] = File.join(@source_paths[:root], 'data', 'wares')
      @output_paths[:links] = File.join(@source_paths[:root], 'data', 'links')

      @hardware = {}
      @software = {}

      @inspired_links = []
      @personal_links = []
    end

    def scan_files
      super

      Dir.glob(File.join(@output_paths[:wares], 'hardware', '*.yml')).each do |path|
        ware = UsesThis::Ware.new(path)
        @hardware[ware.slug] = ware
      end

      Dir.glob(File.join(@output_paths[:wares], 'software', '*.yml')).each do |path|
        ware = UsesThis::Ware.new(path)
        @software[ware.slug] = ware
      end

      Dir.glob(File.join(@output_paths[:links], 'inspired', '*.yml')).each do |path|
        @inspired_links << UsesThis::Link.new(path)
      end

      Dir.glob(File.join(@output_paths[:links], 'personal', '*.yml')).each do |path|
        @personal_links << UsesThis::Link.new(path)
      end

      @posts.each do |post|
        post.scan_links

        post.hardware.each do |slug, data|
          @hardware[slug].interviews << post.slug unless @hardware[slug].interviews.include?(post.slug)
        end

        post.software.each do |slug, data|
          @software[slug].interviews << post.slug unless @software[slug].interviews.include?(post.slug)
        end
      end
    end
  end
end