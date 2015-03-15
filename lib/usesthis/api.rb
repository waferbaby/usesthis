module UsesThis
  class API
    API_VERSION = "1"

    attr_accessor :site
    attr_accessor :path

    def initialize(site)
      @site = site
      @path = File.join(@site.output_paths[:site], 'api', "v#{API_VERSION}")
    end

    def generate
      prepare

      generate_interviews
      generate_interview_categories
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
          FileUtils.mkdir_p(File.join(@path, type))
        end
      rescue => e
        raise "Failed to prepare the API directories (#{e})"
      end
    end

    def generate_interviews
      interviews = []
      path = File.join(@path, 'interviews')
      
      @site.posts.each do |interview|
        interview_hash = interview.to_h
        generate_json_file(path, interview.slug, {interview: interview_hash})

        interview_hash.delete(:contents)
        interview_hash.delete(:gear)

        interviews << interview_hash
      end

      generate_json_file(path, 'index', {interviews: interviews})
    end

    def generate_interview_categories
      categories = []
      path = File.join(@path, 'interviews', 'categories')

      @site.categories.each_key do |category|
        interviews = []

        @site.categories[category].each do |interview|
          interview_hash = interview.to_h

          interview_hash.delete(:contents)
          interview_hash.delete(:gear)

          interviews << interview_hash
        end

        generate_json_file(path, category, {interviews: interviews})

        categories << category
      end

      generate_json_file(path, 'index', {categories: categories.sort!})
    end

    def generate_gear
      %w{hardware software}.each do |type|
        gear = []
        path = File.join(@path, type)

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