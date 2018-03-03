require 'json'

class InterviewGearScanner < Dimples::Plugin
  GEAR_LINK = /\[([^\[\(\)]+)\]\[([a-z0-9\.\-]+)?\]/

  def initialize(site)
    @site = site
  end

  def gear
    @gear ||= {}.tap do |gear|
      path = File.join(@site.paths[:base], 'gear', '**', '*.json')

      Dir.glob(path).sort.each do |path|
        slug = File.basename(path, '.json')
        gear[slug] = JSON.load(File.read(path))
      end
    end
  end

  def supported_events
    [:before_post_write]
  end

  def process(event, interview, &block)
    case event
    when :before_post_write
      links = ''

      interview.contents.scan(GEAR_LINK).each do |link|
        slug = (link[1] ? link[1] : link[0].downcase)
        if (data = gear[slug])
          links << "[#{slug}]: #{data['url']} \"#{data['description']}\"\n"
        end
      end

      interview.contents << "\n\n#{links}" unless links.empty?
    end
  end
end