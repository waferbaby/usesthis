module UsesThis
  class Site < Dimples::Site

    attr_accessor :hardware
    attr_accessor :software
    attr_accessor :inspired_links
    attr_accessor :personal_links

    def initialize(config = {})
      super

      @hardware = {}
      @software = {}

      @inspired_links = {}
      @personal_links = {}

      @output_paths[:wares] = File.join(@source_paths[:root], 'data', 'gear')
      @output_paths[:links] = File.join(@source_paths[:root], 'data', 'links')

      @post_class = UsesThis::Interview
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

      @posts.each do |post|
        post.scan_links
      end
    end

    def generate
      super

      puts @posts.length

      @posts.each do |interview|
        %w{json markdown}.each do |type|
          file = @page_class.new(self)

          file.extension = type
          file.contents = interview.send("to_#{type}".to_sym)
          
          file.write(File.join(@output_paths[:posts], interview.slug))
        end
      end
    end
  end
end