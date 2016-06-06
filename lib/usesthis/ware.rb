module UsesThis
  class Ware
    attr_accessor :slug
    attr_accessor :name
    attr_accessor :description
    attr_accessor :url
    attr_accessor :interviews

    def initialize(path)
      metadata = YAML.load_file(path)

      @slug = File.basename(path, File.extname(path))

      @name = metadata['name']
      @description = metadata['description']
      @url = metadata['url']

      @interviews = []
    end

    def to_markdown
      "[#{slug}]: #{url} \"#{description}\""
    end

    def to_h
      output = {
        slug: @slug,
        name: @name,
        description: @description,
        url: @url
      }

      unless @interviews.empty?
        output[:interviews] = []

        @interviews.each do |interview|
          output[:interviews] << {
            slug: interview.slug,
            name: interview.title
          }
        end
      end

      output
    end
  end
end
