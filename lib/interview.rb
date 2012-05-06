$:.unshift File.dirname(__FILE__)

require 'mongoon/document'

class Interview < Mongoon::Document
        attr_accessor :name, :slug, :date, :summary, :contents, :credits
        
        def self.find_recent
                self.find({}, {:limit => 10}) # Sort by date here.
        end
        
        def self.find_by_slug(slug)
                self.find({'slug' => slug})[0]
        end
        
        def self.find_by_category(category)
        end
        
        def self.find_by_date(year, month = nil, day = nil)
        end
end
