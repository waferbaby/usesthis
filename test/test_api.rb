$LOAD_PATH.unshift(__dir__)

require 'helper'

describe 'API' do
  before do
    test_site.scan_files
    UsesThis::API.generate(test_site)
  end

  describe 'when generating hardware' do
    it 'renders a list' do
      source = read_fixture('hardware-list')
      output = read_api_file(File.join('hardware', 'index.json'))

      output.must_equal(source)
    end

    it 'renders a single piece of gear' do
      source = read_fixture('laptop')
      output = read_api_file(File.join('hardware', 'laptop', 'index.json'))

      output.must_equal(source)
    end
  end

  describe 'when generating software' do
    it 'renders a list' do
      source = read_fixture('software-list')
      output = read_api_file(File.join('software', 'index.json'))

      output.must_equal(source)
    end

    it 'renders a single piece of gear' do
      source = read_fixture('image-editor')
      output = read_api_file(File.join('software', 'image-editor', 'index.json'))

      output.must_equal(source)
    end
  end
end
