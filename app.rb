require 'rubygems'
require 'sinatra/base'
require 'lib/interview'
require 'lib/link'
require 'yaml'
require 'erubis'
require 'kramdown'

class TheSetup < Sinatra::Base
        
        configure do
                begin
                        config = YAML::load_file(File.join(Dir.pwd, 'config', 'database.yml'))                        
                        Resource.database = Mysql2::Client.new(config[:database])
                        
                rescue Exception => e
                        puts "Failed to configure database via config - I'ma quit now."
                        exit
                end
        end
        
        helpers do
                
                def url_for(url)
                        @interview ? "http://usesthis.com" + url : url
                end
                
        end
        
        not_found do
                @interview = Interview.new
                
                @interview.name = "Four O'Four"
                @interview.slug = '404'
                @interview.summary = "HTTP error code (The Internet)"
                
                @title = "What's that?"
                erb :not_found
        end
        
        error do
                @title = "Uh oh"
                erb :error
        end
        
        get '/' do
                @interviews = Interview.recent(:summary => true)
                erb :index
        end
        
        get '/feed/?' do
                content_type "application/atom+xml"
                
                @interviews = Interview.recent
                erb :feed, :layout => false
        end
        
        get '/interviews/?' do
                @title = "Interviews"
                
                @counts = Interview.counts()
                @categories = Category.all()
                
                erb :archives
        end
        
        get '/interviews/in/?' do
                @title = "Years"
                @counts = Interview.counts()
                
                erb :archives
        end
        
        get %r{/interviews/in/([\d]{4})/?$} do |year|
                
                @interviews = Interview.by_year(year, :summary => true)
                @title = "In #{year}" if @interviews.count
                
                erb :index
        end

        get %r{/interviews/([a-z]+)/feed/?$} do |slug|
                content_type "application/atom+xml"
                
                @interviews = Interview.for_category_slug(slug, :limit => 10)
                @title = slug.capitalize if @interviews.count
                
                erb :feed, :layout => false
        end
        
        get %r{/interviews/([a-z]+)/?$} do |slug|
                @interviews = Interview.for_category_slug(slug, :summary => true)
                @title = slug.capitalize if @interviews.count
                
                erb :index
        end
        
        get '/interview/with/:slug/?' do |slug|
                @interview = Interview.with_slug(slug)
                raise Sinatra::NotFound unless @interview
                
                @title = @interview.name
                @heading = "Interview"

                erb :interview
        end
        
        get '/about/?' do
                @title = "About"             
                erb :about
        end
        
        get '/community/?' do
                @title = "Community"
                @links = Link.all()
                
                erb :community
        end     
end