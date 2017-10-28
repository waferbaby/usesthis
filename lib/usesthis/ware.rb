# frozen_string_literal: true

module UsesThis
  # A class that models a single piece of hardware or software.
  class Ware
    attr_accessor :slug
    attr_accessor :name
    attr_accessor :url
    attr_accessor :description
    attr_accessor :interviews

    def initialize(path)
      metadata = JSON.parse(File.read(path))

      @slug = File.basename(path, File.extname(path))

      @name = metadata['name']
      @url = metadata['url']
      @description = metadata['description']

      @interviews = []
    end

    def inspect
      "#<#{self.class} " \
      "@slug=#{@slug} " \
      "@name=#{@name} " \
      "@url=#{@url} " \
      "@description=#{@description}>"
    end
  end

  class Hardware < Ware
  end

  class Software < Ware
  end
end
