require 'rubygems'
require 'mysql2'

class Resource
        class << self
                attr_accessor :database, :table_name
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

        def self.insert(fields)

                keys = fields.keys
                values = fields.values
                
                query = "INSERT INTO #{@table_name} ("
                query += keys.join(', ')
                query += ") VALUES ("
                query += values.map {|value| "'#{Resource.escape(value)}'"}.join(", ")
                query += ")"
                
                Resource.query(query)
                Resource.last_insert_id
        end

        def self.update(id, fields)

                query = "UPDATE #{@table_name} SET "
                query += fields.map {|key, value| "#{key}='#{Resource.escape(value)}'" }.join(", ")
                query += " WHERE id=#{id}"

                Resource.query(query)
        end
end