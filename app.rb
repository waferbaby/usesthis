require 'rubygems'
require 'sinatra/base'
require 'lib/interview'
require 'slim'
require 'yaml'

class TheSetup < Sinatra::Base
        
        configure do
                begin
                        config = YAML::load_file(File.join(Dir.pwd, 'config.yml'))
                
                        Resource.database = Mysql2::Client.new(config[:database])                
                        Slim::Engine.set_default_options(:pretty => true)
                rescue Exception => e
                        puts e
                end
        end
        
        get '/' do
                @interviews = Interview.recent()
                slim :index
        end
        
        get '/interviews/?' do
        end
        
        get '/about/?' do
                slim :about
        end
        
        get '/community/?' do
                slim :community
        end     
end