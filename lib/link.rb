$:.unshift File.dirname(__FILE__)

require 'resource'

class Link < Resource
        
        INSPIRED = 1
        PERSONAL = 2
        
        attr_accessor :id, :type, :name, :url, :description
        
        def self.all
                self.fetch("SELECT * from links ORDER BY name")
        end
        
        def self.inspired_by
                self.fetch("SELECT * from links WHERE type=#{INSPIRED} ORDER BY name")
        end
        
        def self.personal
                self.fetch("SELECT * from links WHERE type=#{PERSONAL} ORDER BY name")
        end
end