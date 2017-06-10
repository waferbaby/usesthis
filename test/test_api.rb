$LOAD_PATH.unshift(__dir__)

require 'helper'

describe 'API' do
  before do
    test_site.scan_files
    UsesThis::API.generate(test_site)
  end

  describe 'when generating interviews' do
    it 'renders an interview' do
      source = test_interview
      output = read_api_file(File.join('interviews', 'interviewee'))

      output.must_equal(source)
    end
  end

  describe 'when generating gear' do
    it 'renders a list' do
      source = read_fixture('hardware-list')
      output = read_api_file('hardware')

      output.must_equal(source)
    end

    it 'renders a single piece of gear' do
      source = read_fixture('laptop')
      output = read_api_file(File.join('hardware', 'laptop'))

      output.must_equal(source)
    end
  end

  describe 'when generating categories' do
    it 'renders a list of categories' do
      source = { 'categories' => test_interview.dig('interview', 'categories') }
      output = read_api_file('categories')

      output.must_equal(source)
    end

    it 'renders a single category' do
      source = read_fixture('category')
      output = read_api_file(File.join('categories', 'fake'))

      output.must_equal(source)
    end
  end

  describe 'when generating stats' do
    it 'renders the basic information' do
      source = {
        'interviews' => test_site.posts.count,
        'hardware' => test_site.hardware.count,
        'software' => test_site.software.count
      }

      output = read_api_file('stats')

      output.must_equal(source)
    end

    it 'renders gear information' do
      source = read_fixture('hardware_stats')
      output = read_api_file(File.join('stats', 'hardware'))

      output.must_equal(source)
    end
  end
end
