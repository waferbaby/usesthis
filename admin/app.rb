require 'rubygems'
require 'sinatra/base'
require 'yaml'
require 'erubis'
require 'cgi'
require 'xmlsimple'

require '../lib/interview'
require '../lib/link'

class TheSetupAdmin < Sinatra::Base
        
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
                def parse_feed(xml)
                        feed = XmlSimple.xml_in(xml, {
                                'KeyAttr' => 'term',
                                'ForceArray' => false,
                        })
                        
                        categories = []
                        
                        unless feed['category'].nil?
                                categories = feed['category'].length == 1 ? feed['category']['term'].to_a : feed['category'].keys
                        end
                        
                        {
                                'name'          => feed['title']['content'],
                                'summary'       => feed['summary']['content'],
                                'answers'       => feed['content']['content'],
                                'is_published'  => feed['control']['draft'] == 'no' ? 1 : 0,
                                'categories'    => categories
                        }
                end
        end
        
        get '/' do
                @categories = Category.all
                
                content_type 'application/atomserv+xml;charset=utf-8'
                erb :index
        end
        
        get '/interviews/?' do
                @interviews = Interview.all
                
                content_type 'application/atom+xml;charset=utf-8'
                erb :interviews
        end
        
        post '/interviews/?' do
                begin
                        feed = parse_feed(request.body.read)
                
                        interview = Interview.new
                
                        interview.name = feed['name']
                        interview.slug = feed['name'].to_slug
                        interview.summary = feed['summary']
                        interview.answers = feed['answers']
                        interview.is_published = feed['is_published']
			
			feed['categories'].each do |slug|
				category = Category.with_slug(slug, true)
				interview.categories << category
			end
						
                        interview.save                        
                        @interviews = [interview]
                        
                        content_type 'application/atom+xml;charset=utf-8'
			status 201
			headers "Location" => "http://#{interview.slug}.usesthis.com/"
			
                        erb :interviews
			
		rescue Exception => e
			halt 500, e.to_s
                end                
        end
        
        get '/interviews/:slug/?' do |slug|
		begin
	                @interviews = [Interview.with_slug(slug)]
                
	                content_type 'application/atom+xml;charset=utf-8'
	                erb :interviews
			
		rescue Exception => e
			halt 500, e.to_s
		end
        end
        
        put '/interviews/:slug/?' do |slug|
                begin
                        @interview = Interview.with_slug(slug)
                        feed = parse_feed(request.body.read)

			@interview.categories = []
			
			feed['categories'].each do |slug|
				category = Category.with_slug(slug, true)
				@interview.categories << category
			end
			
			@interview.update({
                                'name'          => feed['name'],
                                'summary'       => feed['summary'],
                                'answers'       => feed['answers'],
                                'is_published'  => feed['is_published']
                        })
			
			200
			
                rescue Exception => e
                        halt 500, e.to_s
                end
        end
        
        get '/links/?' do
                content_type 'application/atom+xml;charset=utf-8'
                erb :links
        end
        
        get '/wares/?' do
                content_type 'application/atom+xml;charset=utf-8'
                erb :wares
        end
end