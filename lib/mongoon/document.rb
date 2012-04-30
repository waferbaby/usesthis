require 'mongo'

module Mongoon
        class Document
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
                        found = Mongoon::Document.database[self.collection_name].find(*params)
                        
                        results = []
                        
                        found.each do |row|
                                klass = self.new()
                                
                                row.each do |key, value|
                                        klass.send("#{key}=", value.to_s)
                                end
                                
                                results << klass
                        end
                        
                        results
                end
        end
end