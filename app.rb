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
                        puts "Failed to configure database via config.yml - aborting."
                        exit
                end
        end
        
        helpers do
                
                def interview_markdown(interview)
                        contents = "### Who are you, and what do you do?\n\n"
                        contents += interview.overview + "\n\n"
                        contents += "### What hardware do you use?\n\n"
                        contents += interview.hardware + "\n\n"
                        contents += "### And what software?\n\n"
                        contents += interview.software + "\n\n"
                        contents += "### What would be your dream setup?\n\n"
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
                @interview = Interview.new
                
                @interview.name = "Four O'Four"
                @interview.slug = '404'
                @interview.summary = "HTTP error code (The Internet)"
                
                @interview.overview = "I'm the error message sent when the requested page you're after can't be found online. I also do a wee bit of (very amateur) interpretative dance in my spare time."
                @interview.hardware = "To be honest, I'm not entirely sure. It's something rack-mounted, I think. Or, y'know, a freaking *MacBook Pro*?!"
                @interview.software = "I have a serious interest - and let's be honest, it's an obsession - with web server software. Always been there, can't explain it. But I'm a simple creature, so that's it for me, really."
                @interview.dream_setup = "Truthfully, I'm pretty happy with my current setup. I would love it if people were more careful with the URLs they typed, though, y'know?"
                
                category = Category.new
                category.slug = 'web'
                
                @interview.categories = [category]
                
                erb :interview
        end
        
        get '/' do
                @interviews = Interview.recent(:summary => true)
                erb :index
        end
        
        get '/interviews/?' do
                @title = "Interviews"
                
                @stats = Interview.counts()
                @categories = Category.all()
                
                erb :archives
        end
        
        get '/interviews/in/?' do
                @title = "Years"
                @stats = Interview.counts()
                
                erb :archives
        end
        
        get %r{/interviews/in/([\d]{4})?/?} do |year|
                
                @interviews = Interview.by_year(year, :summary => true)
                @title = "In #{year}" if @interviews.count
                
                erb :index
        end
        
        get %r{/interviews/([a-z]+)/?} do |slug|
                @interviews = Interview.for_category_slug(slug, :summary => true)
                @title = slug.capitalize if @interviews.count
                
                erb :index
        end
        
        get '/interview/with/:slug/?' do |slug|
                @interview = Interview.with_slug(slug)
                raise Sinatra::NotFound unless @interview
                
                @title = @interview.name

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