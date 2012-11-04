$:.unshift File.dirname(__FILE__)

require 'category'
require 'string'
require 'ware'

class Interview < Resource
        
        attr_accessor :id, :slug, :name, :summary, :credit_name, :credit_url, :answers, :is_published, :date_publish, :date_create, :date_update
        attr_accessor :categories, :wares
        
        def initialize()
                @categories = []
		@wares = []
        end
        
        def self.fetch(query, options = {})
                interviews = super(query, options)
                
                interviews.each do |interview|
                        interview.categories = Category.for_interview(interview.id)
                        interview.wares = Ware.for_interview(interview.id) if options[:with_wares]
                end
                
                interviews
	rescue Exception => e
		raise InterviewException.new("Failed to fetch interviews for query '#{query}' (#{e})")
        end
        
        def self.all(options = {})
                options = {:with_wares => false}.merge!(options)
		fields = options[:with_wares] ? "*" : "id, slug, name, summary, is_published, date_publish, date_create, date_update"
		
                self.fetch("SELECT #{fields} FROM interviews ORDER BY date_publish DESC", options)
	rescue Exception => e
		raise InterviewException.new("Failed to fetch all interviews (#{e})")
        end
        
        def self.recent(options = {})
                options = {:with_wares => false}.merge!(options)
                fields = options[:with_wares] ? "*" : "id, slug, name, summary, is_published, date_publish, date_create, date_update"
                
                self.fetch("SELECT #{fields} FROM interviews WHERE is_published=1 ORDER BY date_publish DESC LIMIT 10", options)
	rescue Exception => e
		raise InterviewException.new("Failed to fetch recent interviews (#{e})")
        end
        
        def self.with_slug(slug, options = {})
		options = {:with_wares => true}.merge!(options)
                result = self.fetch("SELECT * FROM interviews WHERE slug='#{self.escape(slug)}' LIMIT 1", options)
                result.length < 1 ? false : result[0]
	rescue Exception => e
		raise InterviewException.new("Failed to fetch interview with slug '#{slug}' (#{e})")
        end
        
        def self.by_year(year, options = {})
                options = {:with_wares => false}.merge!(options)
                fields = options[:with_wares] ? "*" : "id, slug, name, summary, is_published, date_publish, date_create, date_update"
                
                self.fetch("SELECT #{fields} FROM interviews WHERE year(date_publish) = '#{self.escape(year)}' AND is_published=1 ORDER BY date_publish DESC", options)
	rescue Exception => e
		raise InterviewException.new("Failed to fetch interviews from the year #{year} (#{e})")
        end
        
        def self.for_category_slug(slug, options = {})
                options = {:with_wares => false}.merge!(options)
                fields = options[:with_wares] ? "*" : "i.id, i.slug, i.name, i.summary, i.is_published, i.date_publish, i.date_create, i.date_update"
                
                query = "SELECT #{fields} FROM interviews AS i, interview_categories AS ic, categories AS c WHERE ic.interview_id=i.id AND ic.category_id=c.id AND c.slug = '#{self.escape(slug)}' AND i.is_published=1 ORDER BY i.date_publish DESC"
                query += " LIMIT #{options[:limit]}" if options[:limit]
                
                self.fetch(query, options)
	rescue Exception => e
		raise InterviewException.new("Failed to fetch interviews for the category '#{slug}' (#{e})")
        end

        def self.counts()
                results = Interview.query("SELECT year(date_publish) AS year, count(*) AS count FROM interviews WHERE is_published=1 GROUP BY year ORDER BY year DESC")		
		counts = {'years' => {}, 'total' => 0}
		
		results.each do |row|
			counts['years']["#{row['year']}"] = row['count']
			counts['total'] += row['count']
		end
		
		counts
		
	rescue Exception => e
		raise InterviewException.new("Failed to fetch interviews counts (#{e})")
        end
        
        def save
		now = Time.now
		time = now.strftime('%Y-%m-%d %H:%M:%S')
		
                params = {
                        'slug'          => @slug,
                        'name'          => @name,
                        'summary'       => @summary,
                        'credit_name'   => @credit_name,
                        'credit_url'    => @credit_url,
                        'answers'       => @answers,
			'is_published'	=> @is_published,
			'date_create'	=> time,
			'date_update'	=> time,
                }
		
		keys = params.keys
		values = params.values
                
                query = "INSERT INTO interviews ("
		query += keys.join(',')
		query += ") VALUES ("
		query += values.map {|value| "'#{Interview.escape(value)}'"}.join(", ")
		query += ")"
		
		Interview.query(query)
		
		@id = Interview.last_insert_id
		
		@date_create = now
		@date_update = now
		@date_publish = now if @is_published

		self.link_categories
		self.link_wares
	rescue Exception => e
		raise InterviewException.new(e.to_s =~ /Duplicate entry/ ? "An interview with this slug already exists" : "Failed to save new interview (#{e})")
        end
        
        def update(params)
		now = Time.now
		
                params['date_update'] = now.strftime('%Y-%m-%d %H:%M:%S')
		params['date_publish'] = now.strftime('%Y-%m-%d') if params['is_published']
		
                query = "UPDATE interviews SET "
                query += params.map {|key, value| "#{key}='#{Interview.escape(value)}'" }.join(", ")
                query += " WHERE id=#{@id}"
                
                Interview.query(query)
                        
                params.each_pair { |key, value| self.send("#{key}=", value) }
		
		self.link_categories
                self.link_wares
	rescue Exception => e
		raise InterviewException.new("Failed to update interview #{@id} (#{e})")
        end
        
	def link_categories
		if @categories.length > 0
			Interview.query("DELETE FROM interview_categories WHERE interview_id='#{@id}'")
		
			@categories.each do |category|
				Interview.query("INSERT INTO interview_categories (interview_id, category_id) VALUES ('#{@id}', '#{category.id}')")
			end
		end
	rescue Exception => e
		raise InterviewException.new("Failed to link categories for interview #{@id} (#{e})")
	end
	
        def link_wares
		if @wares.length > 0
	                Interview.query("DELETE FROM interview_wares WHERE interview_id='#{@id}'")
                
	                @wares = []
                
	                @answers.scan(/\[([^\[\(\)]+)\]\[([a-z0-9\.\-]+)?\]/).each do |link|
	                	slug = (link[1] ? link[1] : link[0].downcase)
                        
	                        unless slug.nil?
	                                ware = Ware.with_slug(slug)

	                                unless ware.nil?
	                                        Interview.query("INSERT INTO interview_wares (interview_id, ware_id) VALUES ('#{@id}', '#{ware.id}')")
	                                        @wares << ware
	                                end
	                        end
			end
		end
	rescue Exception => e
		raise InterviewException.new("Failed to link wares for interview #{@id} (#{e})")
        end
        
        def to_markdown
                markdown = @answers
                
                if @wares.length > 0
                        markdown += "\n\n"
                        
                        @wares.each do |ware|
                                markdown += "[#{ware.slug}]: #{ware.url} \"#{ware.description}\"\n"
                        end
                end
                
                markdown
        end
end

class InterviewException < Exception
end