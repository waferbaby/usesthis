module UsesThis
  class Ware
    attr_accessor :slug
    attr_accessor :name
    attr_accessor :description
    attr_accessor :url
    attr_accessor :interviews

    def initialize(path)
      metadata = YAML::load_file(path)

      @slug = File.basename(path, File.extname(path))
      
      @name = metadata['name']
      @description = metadata['description']
      @url = metadata['url']

      @interviews = []
    end

    def to_hash
      {
        name: name,
        description: description,
        url: url
      }
    end
  end
end