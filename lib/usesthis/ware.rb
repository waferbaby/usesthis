module UsesThis
  class Ware < Salt::Page
    
    HARDWARE = 'hardware'
    SOFTWARE = 'software'

    attr_accessor :slug
    attr_accessor :name
    attr_accessor :description
    attr_accessor :url
    attr_accessor :type
    attr_accessor :interviews

    def initialize(site, path, type)
      super(site, path)
      
      @slug = File.basename(path, File.extname(path))

      @layout = 'ware'
      @filename = 'index'
      
      @title = @name
      @type = type

      @interviews = {}
    end

    def output_path(parent_path)
      File.join(parent_path, @type, @slug)
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