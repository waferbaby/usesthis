$:.unshift File.dirname(__FILE__)

require 'resource'

class Ware < Resource
        
        HARDWARE = 1
        SOFTWARE = 2
        
        attr_accessor :id, :slug, :type, :name, :description, :url, :date_create, :date_update
        
        def self.for_interview(id)
                self.fetch("SELECT w.* FROM wares AS w, interview_wares AS i WHERE w.id=i.ware_id AND i.interview_id=#{id} ORDER BY w.slug")
        end
        
        def self.popular_hardware(options = {})
                self.popular(HARDWARE, options)
        end
        
        def self.popular_software(options = {})
                self.popular(SOFTWARE, options)
        end
        
        def self.popular(type, options = {})
                self.fetch("SELECT w.*, COUNT(w.id) as weight FROM wares AS w, interview_wares AS iw WHERE w.type=#{type} AND w.id=iw.ware_id GROUP BY w.id ORDER BY weight DESC LIMIT 10", options)
        end
end