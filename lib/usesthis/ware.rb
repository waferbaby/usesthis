require 'rubygems'
require 'yaml'

class Ware
  attr_accessor :slug, :name, :description, :url

  def initialize(path)
    metadata = YAML::load_file(path)

    @slug = File.basename(path, File.extname(path))
    
    %w(name description url).each do |item|
      self.send("#{item}=", metadata[item])
    end
  end
end