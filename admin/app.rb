require 'rubygems'
require 'sinatra/base'
require 'yaml'
require 'erubis'
require 'kramdown'
require 'cgi'

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
        
        get '/' do
                content_type 'application/atomserv+xml;charset=utf-8'
                erb :index
        end
        
        get '/interviews/?' do
                @interviews = Interview.all
                
                content_type 'application/atom+xml;charset=utf-8'
                erb :interviews
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