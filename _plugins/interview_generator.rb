module Jekyll
	class InterviewConverter < Converter

		safe true

		def matches(extension)
			extension =~ /interview/i
		end

		def output_ext(extension)
			".html"
		end

		def convert(content)

			wares_path = File.join(@config['source'], 'wares')

			content += "\n\n"

			content.scan(/\[([^\[\(\)]+)\]\[([a-z0-9\.\-]+)?\]/).each do |link|
				slug = (link[1] ? link[1] : link[0].downcase)
				path = File.join(wares_path, "#{slug}.yml")

				if File.exists?(path)
					begin
						data = YAML::load_file(path)
						content += "[#{slug}]: #{data['url']} \"#{data['description']}\"\n"
					rescue
					end
				end
			end

			Jekyll::MarkdownConverter.new(@config).convert(content.strip)
		end
	end
end
