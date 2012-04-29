require 'rubygems'
require 'sinatra/base'
require 'lib/interview'
require 'slim'

class TheSetup < Sinatra::Base
        
        configure do
                Slim::Engine.set_default_options(:pretty => true)
        end
        
        get '/' do
                @interviews = Interview.find_recent()
                slim :index
        end
        
        get '/interviews/?' do
        end
        
        get '/about/?' do
        end
        
        get '/community/?' do
        end
        
end
