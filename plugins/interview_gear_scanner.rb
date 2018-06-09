# frozen_string_literal: true

require 'json'

# A class for pulling in Markdown gear links via JSON files.
class InterviewGearScanner < Dimples::Plugin
  GEAR_LINK = /\[([^\[\(\)]+)\]\[([a-z0-9\.\-]+)?\]/

  def gear
    @gear ||= {}.tap do |gear|
      glob_path = File.join(@site.paths[:source], 'gear', '**', '*.json')

      Dir.glob(glob_path).sort.each do |path|
        slug = File.basename(path, '.json')
        gear[slug] = JSON.parse(File.read(path))
      end
    end
  end

  def supported_events
    [:before_post_write]
  end

  def process(event, interview)
    case event
    when :before_post_write
      links = []

      interview.contents.scan(GEAR_LINK).each do |link|
        slug = (link[1] ? link[1] : link[0].downcase)
        if (data = gear[slug])
          links << "[#{slug}]: #{data['url']} \"#{data['description']}\"\n"
        end
      end

      interview.contents << "\n\n#{links.join}" unless links.empty?
    end
  end
end
