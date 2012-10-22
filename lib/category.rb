$:.unshift File.dirname(__FILE__)

require 'resource'

class Category < Resource
        
        attr_accessor :id, :slug, :date_create
        
	def self.with_slug(slug, create_if_new = false)
		result = self.fetch("SELECT * FROM categories WHERE slug='#{self.escape(slug)}' LIMIT 1")
		
		return result[0] if result.length == 1
		return false unless create_if_new
			
		category = Category.new
		category.slug = slug
		
		category.save
			
		category
	rescue Exception => e
		raise CategoryException.new("Failed to fetch category with slug '#{slug}' (#{e})")
	end
	
        def self.for_interview(id)
                self.fetch("SELECT c.id, c.slug FROM categories AS c, interview_categories AS i WHERE c.id=i.category_id AND i.interview_id=#{id} ORDER BY c.slug")
	rescue Exception => e
		raise CategoryException.new("Failed to fetch categories for interview #{id} (#{e})")
        end
        
        def self.all
                self.fetch("SELECT id, slug from categories ORDER BY slug")
	rescue Exception => e
		raise CategoryException.new("Failed to fetch all categories (#{e})")
        end
	
        def save
		now = Time.now
		time = now.strftime('%Y-%m-%d %H:%M:%S')
		
                Category.query("INSERT INTO categories (slug, date_create) VALUES ('#{Category.escape(@slug)}', '#{Category.escape(time)}')")
		
		@id = Category.last_insert_id		
		@date_create = now
	rescue
		raise CategoryException.new(e.to_s =~ /Duplicate entry/ ? "A category with this slug already exists" : "Failed to save new category (#{e})")
        end
end

class CategoryException < Exception
end