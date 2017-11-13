# frozen_string_literal: true

$LOAD_PATH.unshift(__dir__)

require 'helper'

describe UsesThis::Api::StatsGenerator do
  describe 'when generating' do
    before do
      test_site.scan_files
      UsesThis::Api::StatsGenerator.generate(test_site)
    end

    it 'creates the basic statistics' do
      match_api_fixture('api.stats.index')
    end

    it 'creates the main hardware statistics' do
      match_api_fixture('api.stats.hardware')
    end

    it 'creates the main software statistics' do
      match_api_fixture('api.stats.software')
    end

    it 'creates hardware statistics by date' do
      match_api_fixture('api.stats.hardware.2017')
    end

    it 'creates software statistics by date' do
      match_api_fixture('api.stats.software.2017')
    end
  end
end
