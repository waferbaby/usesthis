# frozen_string_literal: true

$LOAD_PATH.unshift(__dir__)

require 'helper'

describe UsesThis::Api::CategoriesGenerator do
  describe 'when generating' do
    before do
      test_site.scan_files
      UsesThis::Api::CategoriesGenerator.generate(test_site)
    end

    it 'creates a list of categories' do
      match_api_fixture('api.categories.index')
    end

    it 'creates a single category' do
      match_api_fixture('api.categories.mac')
    end
  end
end
