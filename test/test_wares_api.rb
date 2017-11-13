# frozen_string_literal: true

$LOAD_PATH.unshift(__dir__)

require 'helper'

describe UsesThis::Api::WaresGenerator do
  describe 'when generating' do
    before do
      test_site.scan_files
      UsesThis::Api::WaresGenerator.generate(test_site)
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
  end
end
