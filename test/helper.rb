require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'usesthis'
require 'json'

def test_site
  @site ||= UsesThis::Site.new(Dimples::Configuration.new(
    'source_path' => File.join(__dir__, 'source'),
    'destination_path' => File.join(File::SEPARATOR, 'tmp', 'site', "usesthis-#{Time.new.to_i}"),
    'class_overrides' => {
      'site' => 'UsesThis::Site',
      'post' => 'UsesThis::Interview'
    }
  ))
end

def read_api_file(path)
  path = File.join(test_site.output_paths[:site], 'api', path)
  JSON.load(File.read(path))
end

def read_fixture(name)
  path = File.join(__dir__, 'fixtures', "#{name}.json")
  JSON.load(File.read(path))
end
