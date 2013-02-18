module Jekyll
	class InterviewConverter < Converter

		safe true

		def initialize(config)
			@wares = {}

			Dir.glob(File.join(config['source'], 'wares', "*.yml")) do |path|
				begin
					@wares[File.basename(path, File.extname(path))] = YAML::load_file(path)
				rescue
				end
			end

			super(config)
		end

		def matches(extension)
			extension =~ /interview/i
		end

		def output_ext(extension)
			".html"
		end

		def convert(content)

			content += "\n\n"

			content.scan(/\[([^\[\(\)]+)\]\[([a-z0-9\.\-]+)?\]/).each do |link|
				slug = (link[1] ? link[1] : link[0].downcase)

				if data = @wares[slug]
					content += "[#{slug}]: #{data['url']} \"#{data['description']}\"\n"
				end
				
			end

			Jekyll::MarkdownConverter.new(@config).convert(content.strip)
		end
	end
end
