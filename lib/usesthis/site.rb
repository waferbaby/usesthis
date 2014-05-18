require 'json'
require 'json/ext'

module UsesThis
  class Site < Salt::Site

    attr_accessor :hardware
    attr_accessor :software
    attr_accessor :popular_hardware
    attr_accessor :popular_software
    attr_accessor :inspired_links
    attr_accessor :personal_links

    def initialize(config = {})
      super

      @hardware = {}
      @software = {}

      @popular_hardware = []
      @popular_software = []

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
        ware = UsesThis::Ware.new(self, path, Ware::HARDWARE)
        @hardware[ware.slug] = ware
      end

      Dir.glob(File.join(@output_paths[:wares], 'software', '*.yml')).each do |path|
        ware = UsesThis::Ware.new(self, path, Ware::SOFTWARE)
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
          @hardware[slug].interviews[post.slug] ||= post.name
        end

        post.software.each do |slug, data|
          @software[slug].interviews[post.slug] ||= post.name
        end
      end

      @popular_hardware = @hardware.sort_by { |slug, ware| ware.interviews.length }.reverse[0..9]
      @popular_software = @software.sort_by { |slug, ware| ware.interviews.length }.reverse[0..9]
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