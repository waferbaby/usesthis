# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'usesthis'
require 'json'
require 'little-fixtures'

def test_configuration
  {
    source_path: File.join(__dir__, 'source'),
    destination_path: File.join(
      File::SEPARATOR, 'tmp', "usesthis-#{Time.new.to_i}"
    ),
    class_overrides: {
      site: 'UsesThis::Site',
      post: 'UsesThis::Interview'
    }
  }
end

def fixtures
  @fixtures ||= LittleFixtures.load(File.join(__dir__, 'fixtures'))
end

def match_api_fixture(fixture)
  expected_output = JSON.parse(fixtures[fixture])

  parts = fixture.split('.')
  parts.delete('index') if parts.last == 'index'

  path = File.join(
    @site.output_paths[:site],
    parts,
    'index.json'
  )

  File.exist?(path).must_equal(true)
  JSON.parse(File.read(path)).must_equal(expected_output)
end