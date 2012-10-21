$:.unshift File.dirname(__FILE__)

require 'category'
require 'string'
require 'ware'

class Interview < Resource
        
        attr_accessor :id, :slug, :name, :summary, :credit_name, :credit_url, :answers, :is_published, :date_publish, :date_create, :date_update
        attr_accessor :categories, :wares
        
        def initialize()
                categories, wares = []
        end
        
        def self.fetch(query, options = {})
                interviews = super(query, options)
                
                interviews.each do |interview|
                        interview.categories = Category.for_interview(interview.id)
                        interview.wares = Ware.for_interview(interview.id) unless options[:summary]
                end
                
                interviews
        end
        
        def self.all(options = {})
                options = {:summary => false}.merge!(options)
                self.fetch("SELECT * FROM interviews ORDER BY date_publish DESC", options)          
        end
        
        def self.recent(options = {})
                options = {:summary => false}.merge!(options)
                fields = options[:summary] ? "id, slug, name, summary, is_published, date_publish" : "*"
                
                self.fetch("SELECT #{fields} FROM interviews WHERE is_published=1 ORDER BY date_publish DESC LIMIT 10", options)
        end
        
        def self.with_slug(slug, options = {})
                slug = self.escape(slug)
                result = self.fetch("SELECT * FROM interviews WHERE slug='#{slug}'", options)
                
                result.length < 1 ? false : result[0]
        end
        
        def self.by_year(year, options = {})
                year = self.escape(year)
                
                options = {:summary => false}.merge!(options)
                fields = options[:summary] ? "id, slug, name, summary, is_published, date_publish" : "*"
                
                self.fetch("SELECT * FROM interviews WHERE year(date_publish) = '#{year}' AND is_published=1 ORDER BY date_publish DESC", options)
        end
        
        def self.for_category_slug(slug, options = {})
                slug = self.escape(slug)
                
                options = {:summary => false}.merge!(options)
                fields = options[:summary] ? "i.id, i.slug, i.name, i.summary, i.is_published, i.date_publish" : "i.*"
                
                query = "SELECT #{fields} FROM interviews AS i, interview_categories AS ic, categories AS c WHERE ic.interview_id=i.id AND ic.category_id=c.id AND c.slug = '#{slug}' AND i.is_published=1 ORDER BY i.date_publish DESC"
                query << " LIMIT #{options[:limit]}" if options[:limit]
                
                self.fetch(query, options)
        end

        def self.counts()
                Interview.query("SELECT year(date_publish) AS year, count(*) AS count FROM interviews WHERE is_published=1 GROUP BY year ORDER BY year DESC")
        end
        
        def self.years()
                Interview.query("SELECT year(date_publish) AS year FROM interviews WHERE is_published=1 GROUP BY year ORDER BY year DESC")
        end
        
        def save
		now = Time.now
		time = now.strftime('%Y-%m-%d %H:%M:%S')
		
                params = {
                        'slug'          => self.slug,
                        'name'          => self.name,
                        'summary'       => self.summary,
                        'credit_name'   => self.credit_name,
                        'credit_url'    => self.credit_url,
                        'answers'       => self.answers,
			'is_published'	=> self.is_published,
			'date_create'	=> time,
			'date_update'	=> time,
                }
		
		keys = params.keys
		values = params.values
                
                query = "INSERT INTO interviews ("
		query += keys.join(',')
		query += ") VALUES ("
		query += values.map {|value| "'#{Resource.escape(value)}'"}.join(", ")
		query += ")"
		
                r = Interview.query(query)
		
		self.id = Interview.last_insert_id
		
		self.date_create = now
		self.date_update = now
		self.date_publish = now if self.is_published

		self.link_wares
        end
        
        def update(params)
		now = Time.now
		
                params['date_update'] = now.strftime('%Y-%m-%d %H:%M:%S')
		params['date_publish'] = now.strftime('%Y-%m-%d') if params['is_published']
		
                query = "UPDATE interviews SET "
                query += params.map {|key, value| "#{key}='#{Resource.escape(value)}'" }.join(", ")
                query += " WHERE id=#{self.id}"
                
                Interview.query(query)
                        
                params.each_pair { |key, value| self.send("#{key}=", value) }
                self.link_wares unless self.answers == params['answers']
        end
        
        def link_wares
                Interview.query("DELETE FROM interview_wares WHERE interview_id='#{self.id}'")
                
                self.wares = []
                
                self.answers.scan(/\[([^\[\(\)]+)\]\[([a-z0-9\.\-]+)?\]/).each do |link|
                	slug = (link[1] ? link[1] : link[0].downcase)
                        
                        unless slug.nil?
                                ware = Ware.with_slug(slug)

                                unless ware.nil?
                                        Interview.query("INSERT INTO interview_wares (interview_id, ware_id) VALUES ('#{self.id}', '#{ware.id}')")
                                        self.wares << ware
                                end
                        end
		end
        end
        
        def to_markdown
                markdown = self.answers
                
                if self.wares.length > 0
                        markdown += "\n\n"
                        
                        self.wares.each do |ware|
                                markdown += "[#{ware.slug}]: #{ware.url} \"#{ware.description}\"\n"
                        end
                end
                
                markdown
        end

end