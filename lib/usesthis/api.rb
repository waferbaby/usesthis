module UsesThis
  class API
    VERSION = "1"
    @site = nil

    def self.generate(site)
      @site = site
      output_path = File.join(@site.output_paths[:site], 'api', "v#{VERSION}")

      %w[categories interviews hardware software].each do |type|
        FileUtils.mkdir_p(File.join(output_path, type))
      end

      generate_interviews(output_path)
      generate_categories(output_path)
      generate_gear(output_path)

    rescue Dimples::Errors::RenderingError, Dimples::Errors::PublishingError => e
      puts "API error: Failed to generate #{e.file}: #{e.message}"
    rescue => e
      puts "API error: #{e}"
    end

    private

    def self.generate_interviews(output_path)
      path = File.join(output_path, 'interviews')
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

    def self.generate_categories(output_path)
      path = File.join(output_path, 'categories')
      category_slugs = []

      @site.categories.each do |slug, posts|
        interviews = []

        posts.each do |interview|
          interview_hash = interview.to_h

          interview_hash.delete(:contents)
          interview_hash.delete(:gear)

          interviews << interview_hash
        end

        generate_json_file(path, slug, {interviews: interviews})
        category_slugs << slug
      end

      generate_json_file(path, 'index', {categories: category_slugs.sort!})
    end

    def self.generate_gear(output_path)
      %w{hardware software}.each do |type|
        path = File.join(output_path, type)
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

    def self.generate_json_file(path, filename, contents)
      file = @site.page_class.new(@site)

      file.filename = filename
      file.extension = 'json'
      file.contents = Oj.dump(contents, indent: 2)

      file.write(path, false)
    end
  end
end