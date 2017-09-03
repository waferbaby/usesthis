# frozen_string_literal: true

$LOAD_PATH.unshift(__dir__)

require 'helper'

describe UsesThis::API do
  describe "when generating the API" do
    before do
      @site = UsesThis::Site.new(test_configuration)
      @site.scan_files

      UsesThis::API.generate(@site)
    end

    it 'creates a list of interviews' do
      match_api_fixture('api.interviews.index')
    end

    it 'creates a single interview' do
      match_api_fixture('api.interviews.interviewee')
    end

    it 'creates a list of hardware' do
      match_api_fixture('api.hardware.index')
    end

    it 'creates a single piece of hardware' do
      match_api_fixture('api.hardware.laptop')
    end

    it 'creates a list of software' do
      match_api_fixture('api.software.index')
    end

    it 'creates a single piece of software' do
      match_api_fixture('api.software.image-editor')
    end

    it 'creates a list of categories' do
      match_api_fixture('api.categories.index')
    end

    it 'creates a single category' do
      match_api_fixture('api.categories.fake')
    end

    it 'creates the basic statistics' do
      match_api_fixture('api.stats.index')
    end

    it 'creates the hardware statistics' do
      match_api_fixture('api.stats.hardware')
    end
  end
end
