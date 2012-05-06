require 'rubygems'
require 'sinatra/base'
require 'lib/interview'
require 'slim'

class TheSetup < Sinatra::Base
        
        configure do
                Mongoon::Document.database = Mongo::Connection.new.db("usesthis")
                Slim::Engine.set_default_options(:pretty => true)
        end
        
        get '/' do
                @interviews = Interview.find_recent()
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