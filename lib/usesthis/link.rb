require 'rubygems'
require 'yaml'

module UsesThis
  class Link
    attr_accessor :name, :summary, :url

    def initialize(path)
      metadata = YAML::load_file(path)

      @slug = File.basename(path, File.extname(path))
      
      %w(name summary url).each do |item|
        self.send("#{item}=", metadata[item])
      end
    end
  end
end