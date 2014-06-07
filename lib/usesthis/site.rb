require 'json'
require 'json/ext'

module UsesThis
  class Site < Salt::Site

    attr_accessor :hardware
    attr_accessor :software
    attr_accessor :inspired_links
    attr_accessor :personal_links

    def initialize(config = {})
      super

      @hardware = {}
      @software = {}

      @inspired_links = []
      @personal_links = []

      @output_paths[:wares] = File.join(@source_paths[:root], 'data', 'wares')
      @output_paths[:links] = File.join(@source_paths[:root], 'data', 'links')

      set_hook(:after_post, :post_process_interview)
      register(UsesThis::Interview)
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
      end
    end

    def post_process_interview(interview)
      json_file = @klasses[:page].new(self)
      json_file.extension = 'json'
      json_file.contents = JSON.pretty_generate(interview.to_hash)

      json_file.write(File.join(@output_paths[:posts], interview.slug))

      markdown_file = @klasses[:page].new(self)
      markdown_file.extension = 'markdown'
      markdown_file.contents = interview.to_markdown

      markdown_file.write(File.join(@output_paths[:posts], interview.slug))      
    end
  end
end