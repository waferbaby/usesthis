$:.unshift File.dirname(__FILE__)

require 'resource'

class Category < Resource
        
        attr_accessor :id, :slug
        
        def self.for_interview(id)
                self.fetch("SELECT id, slug FROM categories AS c, interview_categories AS i WHERE c.id=i.category_id AND i.interview_id=#{id}")
        end
end