module UsesThis
  class API
    VERSION = "1"

    attr_accessor :site
    attr_accessor :path

    def initialize(site)
      @site = site
      @path = File.join(@site.output_paths[:site], 'api', "v#{VERSION}")
    end

    def generate
      paths = [
        'interviews',
        'hardware',
        'software',
        ['interviews', 'categories']
      ]

      paths.each do |type|
        FileUtils.mkdir_p(File.join(@path, type))
      end

      generate_interviews
      generate_interview_categories
      generate_gear

    rescue Dimples::Errors::RenderingError, Dimples::Errors::PublishingError => e
      puts "API error: Failed to generate #{e.file}: #{e.message}"
    rescue => e
      puts "API error: #{e}"
    end

    def generate_interviews
      path = File.join(@path, 'interviews')
      interviews = []

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
      path = File.join(@path, 'interviews', 'categories')
      category_slugs = []

      @site.categories.each_value do |category|
        interviews = []

        category.posts.each do |interview|
          interview_hash = interview.to_h

          interview_hash.delete(:contents)
          interview_hash.delete(:gear)

          interviews << interview_hash
        end

        generate_json_file(path, category.slug, {interviews: interviews})
        category_slugs << category.slug
      end

      generate_json_file(path, 'index', {categories: category_slugs.sort!})
    end

    def generate_gear
      %w{hardware software}.each do |type|
        path = File.join(@path, type)
        gear = []

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