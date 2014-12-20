require 'json'
require 'json/ext'

module UsesThis
  class Site < Salt::Site

    attr_accessor :hardware
    attr_accessor :software
    attr_accessor :popular_hardware
    attr_accessor :popular_software

    def initialize(config = {})
      super

      @hardware = {}
      @software = {}

      @popular_hardware = []
      @popular_software = []

      @output_paths[:wares] = File.join(@source_paths[:root], 'data')
      @post_class = UsesThis::Interview

      set_hook(:after_post, :post_process_interview)
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

        post.hardware.each_key { |slug| @hardware[slug].interviews << {slug: post.slug, name: post.name} }
        post.software.each_key { |slug| @software[slug].interviews << {slug: post.slug, name: post.name} }
      end

      @popular_hardware = @hardware.values.sort { |a, b| b.interviews.length <=> a.interviews.length }[0...10]
      @popular_software = @software.values.sort { |a, b| b.interviews.length <=> a.interviews.length }[0...10]
    end

    def post_process_interview(interview)
      json_file = @page_class.new(self)
      json_file.extension = 'json'
      json_file.contents = JSON.pretty_generate(interview.to_hash)

      json_file.write(File.join(@output_paths[:posts], interview.slug))

      markdown_file = @page_class.new(self)
      markdown_file.extension = 'markdown'
      markdown_file.contents = interview.to_markdown

      markdown_file.write(File.join(@output_paths[:posts], interview.slug))      
    end
  end
end