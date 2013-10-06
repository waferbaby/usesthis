module UsesThis
  class Ware
    attr_accessor :slug, :name, :description, :url

    def initialize(path)
      metadata = YAML::load_file(path)

      @slug = File.basename(path, File.extname(path))

      @name = metadata['name']
      @description = metadata['description']
      @url = metadata['url']
    end
  end
end