require 'rubygems'
require 'sinatra/base'
require 'yaml'
require 'erubis'
require 'kramdown'

require '../lib/interview'
require '../lib/link'

class TheSetup < Sinatra::Base
        
        configure do
                begin
                        config = YAML::load_file('../config/database.yml')                        
                        Resource.database = Mysql2::Client.new(config[:database])
                        
                        set :markdown, :auto_ids => false
                        set :markdown, :entity_output => :numeric
                        
                rescue Exception => e
                        puts "Failed to configure database via config - I'ma quit now."
                        exit
                end
        end
        
        helpers do
                
                def url_for(url)
                        @interview || @fake_interview ? "http://usesthis.com" + url : url
                end
                
        end
	
	before do
		@location = case request.path
			when /^\/$/
				'home'
			when /^\/interviews?/
				'interviews'
			when /^\/about/
				'about'
			when /^\/community/
				'community'
			else
				''
			end
	end
        
        not_found do
                @fake_interview = Interview.new

                @fake_interview.name = "Four O'Four"
                @fake_interview.slug = '404'
                @fake_interview.summary = "HTTP error code (The Internet)"
		
		['error', '404'].each do |slug|
			category = Category.new
			category.slug = slug
			
			@fake_interview.categories << category
		end
		
                @title = "What's that?"
                erb :not_found
        end
        
        error do
                @title = "Uh oh"
                erb :error
        end
        
        get '/' do
                @title = "Hello"
                
                @interviews = Interview.recent		
		last_modified @interviews[0].date_update
		
                erb :index
        end

        get '/about/?' do
                @title = "About"             
                erb :about
        end

        get '/community/?' do
                @title = "Community"
                
                @inspired_links = Link.inspired_by
                @personal_links = Link.personal
                
                erb :community
        end
                
        get '/feed/?' do
                content_type "application/atom+xml;charset=utf-8"
		
                @interviews = Interview.recent(:with_wares => true)
		
		last_modified @interviews[0].date_update
		etag @interviews[0].answers.to_sha1
		
                erb :feed, :layout => false
        end
        
	get %r{/interviews/?(in/?)?$} do
                @title = "Interviews"
                
                @counts = Interview.counts
                @categories = Category.all
                
                erb :interviews
        end
        
        get %r{/interviews/in/([\d]{4})/?$} do |year|
                
                @interviews = Interview.by_year(year)
                @title = "In #{year}" if @interviews.count
                
                erb :year_index
        end

        get %r{/interviews/([a-z]+)/feed/?$} do |slug|
                content_type "application/atom+xml;charset=utf-8"
                
                @interviews = Interview.for_category_slug(slug, :with_wares => true, :limit => 10)
                @title = slug.capitalize
		
		last_modified @interviews[0].date_update
		etag @interviews[0].answers.to_sha1
                
                erb :feed, :layout => false
        end
        
        get %r{/interviews/([a-z]+)/?$} do |slug|
                @interviews = Interview.for_category_slug(slug)
		halt 404 unless @interviews.length > 0
		
                @title = slug.capitalize if @interviews.count
                
                erb :category_index
        end
        
        get '/interview/with/:slug/?' do |slug|
                @interview = Interview.with_slug(slug)
                halt 404 unless @interview
                
                @title = @interview.name
                @heading = "Interview"
		
		last_modified @interview.date_update
		etag @interview.answers.to_sha1

                erb :interview
        end
end