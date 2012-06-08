require 'rubygems'
require 'mysql2'

class Resource
        class << self
                attr_accessor :database
        end
                
        def self.fetch(query, options = {})
                items = []
                
                query += " ORDER BY #{options[:order_by]}" if options[:order_by]
                query += " LIMIT #{options[:limit]}" if options[:limit]
                
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
                result.count < 1 ? [] : result.to_a
        end
        
        def self.escape(string)
                Resource.database.escape(string)
        end
end