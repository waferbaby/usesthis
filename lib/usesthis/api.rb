module UsesThis
  class API
    VERSION = '1'.freeze

    @site = nil

    def self.generate(site)
      @site = site
      @output_path = File.join(@site.output_paths[:site], 'api', "v#{VERSION}")

      generate_interviews
      generate_categories
      generate_gear
      generate_stats

    rescue => e
      puts "API error: #{e}"
    end

    def self.generate_interviews
      path = File.join(@output_path, 'interviews')
      interviews = []

      @site.posts.each do |interview|
        interview_hash = interview.to_h
        generate_json_file(File.join(path, interview.slug), interview: interview_hash)

        interview_hash.delete(:contents)
        interview_hash.delete(:gear)

        interviews << interview_hash
      end

      generate_json_file(path, interviews: interviews)
    end

    def self.generate_categories
      path = File.join(@output_path, 'categories')
      category_slugs = []

      @site.categories.each do |slug, posts|
        generate_category(slug, posts, path)
        category_slugs << slug
      end

      generate_json_file(path, categories: category_slugs.sort!)
    end

    def self.generate_category(slug, posts, output_path)
      interviews = []

      posts.each do |interview|
        interview_hash = interview.to_h

        interview_hash.delete(:contents)
        interview_hash.delete(:gear)

        interviews << interview_hash
      end

      generate_json_file(File.join(output_path, slug), interviews: interviews)
    end

    def self.generate_gear
      %w(hardware software).each do |type|
        path = File.join(@output_path, type)
        gear = []

        @site.send("#{type}").each_value do |ware|
          ware_hash = ware.to_h
          generate_json_file(File.join(path, ware.slug), gear: ware_hash)

          ware_hash.delete(:description)
          ware_hash.delete(:url)
          ware_hash.delete(:interviews)

          gear << ware_hash
        end

        generate_json_file(path, gear: gear)
      end
    end

    def self.generate_stats
      %w(hardware software).each do |type|
        path = File.join(@output_path, type, 'stats')
        stats = @site.stats[type.to_sym]

        generate_json_file(path, gear: stats[:all])

        stats[:years].keys.each do |year|
          generate_json_file(File.join(path, year), gear: stats[:years][year])
        end
      end
    end

    def self.generate_json_file(path, contents)
      file = @site.page_class.new(@site)

      FileUtils.mkdir_p(path) unless Dir.exist?(path)

      file.filename = 'index'
      file.extension = 'json'
      file.contents = Oj.dump(contents, indent: 2)

      file.write(path, false)
    end
  end
end
