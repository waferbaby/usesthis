require 'rubygems'
require 'mysql2'

class Resource
        class << self
                attr_accessor :database
        end
                
        def self.fetch(query, options = {})
                items = []
                
                puts query if options[:debug]
                
                Resource.database.query(query).each do |row|
                        item = self.new
                        
                        row.each do |key, value|
                                item.send("#{key}=", value) if item.respond_to?("#{key}=")
                        end
                        
                        items << item
                end  
                
                items
        end
        
        def self.query(query)
                result = Resource.database.query(query)
                !result.nil? && result.count < 1 ? [] : result.to_a
        end
	
	def self.last_insert_id
		Resource.database.last_id
	end
        
        def self.escape(string)
                Resource.database.escape(string.to_s)
        end
        
        def self.join_hash(hash)
                hash.map {|key, value| "#{key}='#{Resource.escape(value)}'" }.join(", ")
        end
end