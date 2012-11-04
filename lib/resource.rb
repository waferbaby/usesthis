require 'rubygems'
require 'mysql2'

class Resource
        class << self
                attr_accessor :database
        end
                
        def self.fetch(query, options = {})
                items = []
                
                Resource.database.query(query).each do |row|
                        item = self.new                        
                        row.each {|key, value| item.send("#{key}=", value) if item.respond_to?("#{key}=") }
                        items << item
                end  
                
                items
        end
        
        def self.query(query)
                Resource.database.query(query)
        end
	
	def self.last_insert_id
		Resource.database.last_id
	end
        
        def self.escape(string)
                Resource.database.escape(string.to_s)
        end
end