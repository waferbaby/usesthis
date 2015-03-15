module UsesThis
  class API
    API_VERSION = "1"

    attr_accessor :site

    def initialize(site)
      @site = site
    end

    def generate
      prepare

      generate_interviews
      generate_gear
    end

    def prepare
      paths = [
        'interviews',
        'hardware',
        'software',
        ['interviews', 'categories']
      ]

      begin
        paths.each do |type|
          FileUtils.mkdir_p(File.join(@site.output_paths[:site], 'api', "v#{API_VERSION}", type))
        end
      rescue => e
        raise "Failed to prepare the API directories (#{e})"
      end
    end

    def generate_interviews
      interviews = []
      path = File.join(@site.output_paths[:site], 'api', "v#{API_VERSION}", 'interviews')
      
      @site.posts.each do |interview|
        interview_hash = interview.to_h
        generate_json_file(path, interview.slug, {interview: interview_hash})

        interview_hash.delete(:contents)
        interview_hash.delete(:gear)

        interviews << interview_hash
      end

      generate_json_file(path, 'index', {interviews: interviews})
    end

    def generate_gear
      %w{hardware software}.each do |type|
        gear = []
        path = File.join(@site.output_paths[:site], 'api', "v#{API_VERSION}", type)

        @site.send("#{type}").each do |slug, ware|
          ware_hash = ware.to_h
          generate_json_file(path, ware.slug, {gear: ware_hash})

          ware_hash.delete(:description)
          ware_hash.delete(:url)
          ware_hash.delete(:interviews)

          gear << ware_hash
        end

        generate_json_file(path, 'index', {gear: gear})
      end
    end

    def generate_json_file(path, filename, contents)
      file = @site.page_class.new(@site)

      file.filename = filename
      file.extension = 'json'
      file.contents = Oj.dump(contents)

      file.write(path, false)
    end
  end
end