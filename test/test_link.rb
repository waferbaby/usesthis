# frozen_string_literal: true

$LOAD_PATH.unshift(__dir__)

require 'helper'

describe 'Link' do
  subject do
    path = File.join(test_site.source_paths[:links], 'inspired', 'the.other.setup.yml')
    UsesThis::Link.new(path)
  end

  describe 'when loading from a YAML file' do
    it 'correctly parses the contents' do
      source = read_yaml_fixture('link')

      subject.name.must_equal(source['name'])
      subject.description.must_equal(source['description'])
      subject.url.must_equal(source['url'])
    end
  end
end
