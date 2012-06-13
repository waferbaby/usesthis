$:.unshift File.dirname(__FILE__)

require 'resource'

class Ware < Resource
        
        attr_accessor :id, :slug, :type, :name, :description, :url, :date_create, :date_update
        
        def self.for_interview(id)
                self.fetch("SELECT w.* FROM wares AS w, interview_wares AS i WHERE w.id=i.ware_id AND i.interview_id=#{id} ORDER BY w.slug")
        end
end