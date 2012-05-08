require 'mongo'

class MongoDocument
        class << self
                attr_accessor :database
        end
                
        attr_accessor :_id
        
        def self.collection_name
                if @collection_name.nil?
                        @collection_name = self.to_s.downcase
                        @collection_name += 's' unless @collection_name.end_with?('s')
                end
                        
                @collection_name
        end
                
        def self.find(*params)
                found = MongoDocument.database[self.collection_name].find(*params)
                        
                results = []
                        
                found.each do |row|
                        klass = self.new()
                                
                        row.each do |key, value|
                                klass.send("#{key}=", value.to_s) if klass.respond_to?("#{key}=")
                        end
                                
                        results << klass
                end
                        
                results
        end
end