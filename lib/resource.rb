require 'mysql2'

class Resource
        class << self
                attr_accessor :database
        end
                
        def self.query(q)
                items = []
                
                begin
                        Resource.database.query(q).each do |row|
                                item = self.new
                        
                                row.each do |key, value|
                                        item.send("#{key}=", value)
                                end
                        
                                items << item
                        end
                        
                rescue Exception => e
                end
                
                items
        end
end