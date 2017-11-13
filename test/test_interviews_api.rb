# frozen_string_literal: true

$LOAD_PATH.unshift(__dir__)

require 'helper'

describe UsesThis::Api::InterviewsGenerator do
  describe 'when generating' do
    before do
      test_site.scan_files
      UsesThis::Api::InterviewsGenerator.generate(test_site)
    end

    it 'creates a list of interviews' do
      match_api_fixture('api.interviews.index')
    end

    it 'creates a single interview' do
      match_api_fixture('api.interviews.interviewee')
    end
  end
end
