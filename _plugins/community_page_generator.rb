module Jekyll

	class CommunityPage < Page

		def initialize(site, base, dir, links)

			@site = site
			@base = base
			@dir = dir
			@name = 'index.html'

			self.process(@name)
			self.read_yaml(File.join(base, '_layouts'), 'community.html')

			self.data['links'] = links
		end
	end

	class CommunityPageGenerator < Generator

		safe true

		def generate(site)
			links = {
				'inspired' => [],
				'personal' => [],
			}
			
			Dir.glob(File.join(site.source, "links", "**", "*.yml")) do |file|

				data = YAML::load_file(file)

				case File.dirname(file).split(File::SEPARATOR)[-1]
					when 'inspired'
						links['inspired'] << data
					when 'personal'
						links['personal'] << data
				end
			end

			site.pages << CommunityPage.new(site, site.source, 'community', links)
		end
	end
end
