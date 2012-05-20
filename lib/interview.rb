$:.unshift File.dirname(__FILE__)

require 'resource'

class Interview < Resource
        
        attr_accessor :slug, :name, :summary, :overview, :hardware, :software, :dream_setup, :date_create
        attr_accessor :categories, :wares
        
        def initialize()
                categories = []
                wares = []
        end
        
        def self.recent()
                interviews = self.fetch("SELECT * FROM interviews ORDER BY date_create DESC")
                
                interviews.each do |interview|
                        categories = Categories.for_interview(interview.slug)
                        wares = Wares.for_interview(interview.slug)
                end
                
                interviews
        end
end