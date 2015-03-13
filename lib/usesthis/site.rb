require 'json/ext'

module UsesThis
  class Site < Dimples::Site
    API_VERSION = "1"

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

    def generate
      super

      begin
        %w{interviews hardware software}.each do |type|
          FileUtils.mkdir_p(File.join(@output_paths[:site], 'api', "v#{API_VERSION}", type))
        end
      rescue => e
        raise "Failed to prepare the API directories (#{e})"
      end

      generate_interview_api
    end

    def generate_interview_api
      interviews = []
      
      @posts.each do |interview|
        file = @page_class.new(self)

        interview_hash = interview.to_h

        file.filename = interview.slug
        file.extension = 'json'
        file.contents = JSON.pretty_generate({
          interview: interview_hash,
        })

        file.write(File.join(@output_paths[:site], 'api', "v#{API_VERSION}", 'interviews'), false)

        interview_hash.delete(:contents)
        interview_hash.delete(:gear)

        interviews << interview_hash
      end

      file = @page_class.new(self)

      file.extension = 'json'
      file.contents = JSON.pretty_generate({
        interviews: interviews,
      })

      file.write(File.join(@output_paths[:site], 'api', "v#{API_VERSION}", 'interviews'), false)
    end
  end
end