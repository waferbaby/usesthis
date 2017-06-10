require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'usesthis'
require 'json'

def test_site
  @test_site ||= UsesThis::Site.new(test_configuration)
end

def test_configuration
  @test_configuration ||= Dimples::Configuration.new(
    'source_path' => File.join(__dir__, 'source'),
    'destination_path' => temp_site_path,
    'class_overrides' => {
      'site' => 'UsesThis::Site',
      'post' => 'UsesThis::Interview'
    }
  )
end

def temp_site_path
  File.join(File::SEPARATOR, 'tmp', "usesthis-#{Time.new.to_i}")
end

def test_interview
  @test_interview ||= read_fixture('interview')
end

def read_api_file(path = nil)
  path = File.join(test_site.output_paths[:site], 'api', path, 'index.json')
  JSON.parse(File.read(path))
end

def read_fixture(name)
  path = File.join(__dir__, 'fixtures', "#{name}.json")
  JSON.parse(File.read(path))
end
