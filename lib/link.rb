$:.unshift File.dirname(__FILE__)

require 'resource'

class Link < Resource
        
        attr_accessor :id, :type, :name, :url, :description
        
        def self.all
                self.fetch("SELECT * from links ORDER BY name")
        end
end