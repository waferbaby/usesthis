$:.unshift File.dirname(__FILE__)

require 'resource'

class Category < Resource
        
        attr_accessor :id, :slug
        
        def self.for_interview(id)
                self.fetch("SELECT c.id, c.slug FROM categories AS c, interview_categories AS i WHERE c.id=i.category_id AND i.interview_id=#{id} ORDER BY c.slug")
        end
        
        def self.all
                self.fetch("SELECT id, slug from categories ORDER BY slug")
        end
end