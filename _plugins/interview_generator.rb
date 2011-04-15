module Jekyll
	class InterviewConverter < Converter

		def matches(ext)
			ext =~ /interview/i
		end
		
		def output_ext(ext)
			".html"
		end
		
		def convert(content)
			wares = Dir.glob('./{hardware,software}/*.yml')
			slugs = []
			
			content.scan(/\[([^\[\(\)]+)\]\[([a-z0-9\.\-]+)?\]/).each do |link|
				slugs << (link[1] ? link[1] : link[0].downcase)
			end
			
			if slugs.length > 0
				content += "\n\n"
				
				wares.each do |ware|
					base_name = File.basename(ware, ".yml")
				
					if slugs.include? base_name
						begin
							data = YAML.load_file(ware)
							content += "[#{base_name}]: " + data["url"] + " \"" + data["description"] + "\"\n"
						
							slugs.delete(base_name)
						rescue
						end
					end
				end
			end
			
			Maruku.new(content).to_html
		end
	end
end