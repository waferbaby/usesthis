$:.unshift File.dirname(__FILE__)

require 'resource'

class Interview < Resource
        
        attr_accessor :slug, :name, :summary, :credit_name, :credit_url, :overview, :hardware, :software, :dream_setup, :published_on, :date_create, :date_update
        attr_accessor :categories, :wares
        
        def initialize()
                categories = []
                wares = []
        end
        
        def self.recent(options)
                options = {:summary => false, :limit => 10}.merge!(options)
                fields = options[:summary] ? "slug, name, summary, published_on" : "*"
                
                interviews = self.fetch("SELECT #{fields} FROM interviews ORDER BY published_on DESC LIMIT #{options[:limit]}")                
                
                interviews.each do |interview|
                        #categories = Categories.for_interview(interview.slug)
                        #wares = Wares.for_interview(interview.slug)
                end
                
                interviews
        end
end