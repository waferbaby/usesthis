# frozen_string_literal: true

$LOAD_PATH.unshift(__dir__)

require 'helper'

describe 'Link' do
  before do
    path = File.join(
      test_configuration[:source_path],
      'links',
      'inspired',
      'the.other.setup.yml'
    )

    @link = UsesThis::Link.new(path)
  end

  describe 'when loading from a YAML file' do
    it 'correctly parses the contents' do
      expected_output = YAML.safe_load(fixtures['link'])

      %w[name description url].each do |key|
        @link.send(key).must_equal(expected_output[key])
      end
    end
  end
end
