$:.unshift File.dirname(__FILE__)

require 'category'
require 'ware'

class Interview < Resource
        
        attr_accessor :id, :slug, :name, :summary, :credit_name, :credit_url, :overview, :hardware, :software, :dream_setup, :published_on, :date_create, :date_update
        attr_accessor :categories, :wares
        
        def initialize()
                categories = []
                wares = []
        end
        
        def self.fetch(query, options = {})
                interviews = super(query, options)
                
                interviews.each do |interview|
                        interview.categories = Category.for_interview(interview.id)
                        interview.wares = Ware.for_interview(interview.id) unless options[:summary]
                end
                
                interviews
        end
        
        def self.recent(options = {})
                options = {
                        :summary => false,
                        :limit => 10,
                        :order_by => 'published_on DESC',
                }.merge!(options)
                
                fields = options[:summary] ? "id, slug, name, summary, published_on" : "*"
                
                self.fetch("SELECT #{fields} FROM interviews", options)                
        end
        
        def self.for_category_slug(slug, options = {})
                slug = Resource.database.escape(slug)
                
                options = {:summary => false, :order_by => 'i.published_on DESC'}.merge!(options)
                fields = options[:summary] ? "i.id, i.slug, i.name, i.summary, i.published_on" : "i.*"
                
                self.fetch("SELECT #{fields} FROM interviews AS i, interview_categories AS ic, categories AS c WHERE ic.interview_id=i.id AND ic.category_id=c.id AND c.slug = '#{slug}'", options)
        end
end