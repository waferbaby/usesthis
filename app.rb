require 'rubygems'
require 'sinatra/base'
require 'lib/interview'
require 'slim'
require 'yaml'
require 'kramdown'

class TheSetup < Sinatra::Base
        
        configure do
                begin
                        config = YAML::load_file(File.join(Dir.pwd, 'config', 'database.yml'))
                        
                        Resource.database = Mysql2::Client.new(config[:database])
                        Slim::Engine.set_default_options(:pretty => true)
                        
                rescue Exception => e
                        puts "Failed to configure database via config.yml - aborting."
                        exit
                end
        end
        
        helpers do
                
                def interview_markdown(interview)
                        contents = "#### Who are you, and what do you do?\n\n"
                        contents += interview.overview + "\n\n"
                        contents += "#### What hardware do you use?\n\n"
                        contents += interview.hardware + "\n\n"
                        contents += "#### And what software?\n\n"
                        contents += interview.software + "\n\n"
                        contents += "#### What would be your dream setup?\n\n"
                        contents += interview.dream_setup
                
                        if interview.wares
                                contents += "\n\n"
                        
                                interview.wares.each do |ware|
                                        contents += "[#{ware.slug}]: #{ware.url} \"#{ware.description}\"\n"
                                end
                        end
                
                        contents
                end
                
        end
        
        not_found do
                slim :not_found
        end
        
        get '/' do
                @interviews = Interview.recent(:summary => true)
                slim :index
        end
        
        get '/interviews/?' do
                @title = "Interviews"
                
                @stats = Interview.counts()
                @categories = Category.all()
                
                slim :interviews
        end
        
        get '/interviews/in/?' do
                @title = "Years"
                @stats = Interview.counts()
                
                slim :interviews
        end
        
        get %r{/interviews/in/([\d]{4})?/?} do |year|
                
                @interviews = Interview.by_year(year, :summary => true)
                @title = "In #{year}" if @interviews.count
                
                slim :index
        end
        
        get %r{/interviews/([a-z]+)/?} do |slug|
                @interviews = Interview.for_category_slug(slug, :summary => true)
                @title = slug.capitalize if @interviews.count
                
                slim :index
        end
        
        get '/interview/with/:slug/?' do |slug|
                @interview = Interview.with_slug(slug)
                raise Sinatra::NotFound unless @interview
                
                @title = @interview.name

                slim :interview
        end
        
        get '/about/?' do
                @title = "About"             
                slim :about
        end
        
        get '/community/?' do
                @title = "Community"
                slim :community
        end     
end