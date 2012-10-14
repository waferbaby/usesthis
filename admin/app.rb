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
                        XmlSimple.xml_in(xml, {
                                'ForceArray' => false,
                                'NoAttr' => true,
                        })
                end
        end
        
        get '/' do
                content_type 'application/atomserv+xml;charset=utf-8'
                erb :index
        end
        
        get '/interviews/?' do
                @interviews = Interview.all
                
                content_type 'application/atom+xml;charset=utf-8'
                erb :interviews
        end
        
        post '/interviews/?' do
        end
        
        get '/interviews/:slug/?' do |slug|
                @interviews = [Interview.with_slug(slug)]
                
                content_type 'application/atom+xml;charset=utf-8'
                erb :interviews
        end
        
        put '/interviews/:slug/?' do |slug|
                
                begin
                        @interview = Interview.with_slug(slug)
                        feed = parse_feed(request.body.read)
                        
                        @interview.update({
                                'name'         => feed['title'],
                                'answers'       => feed['content'],
                                'is_published'  => (feed['control']['draft'] == 'no') ? 1 : 0
                        })

                        200
                rescue
                        500
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