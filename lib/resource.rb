require 'mysql2'

class Resource
        class << self
                attr_accessor :database
        end
                
        def self.fetch(q)
                items = []
                
                begin
                        Resource.database.query(q).each do |row|

                                item = self.new
                        
                                row.each do |key, value|
                                        
                                        begin
                                                item.send("#{key}=", value)
                                        rescue
                                        end
                                end
                        
                                items << item
                        end  
                rescue
                end
                
                items
        end
end