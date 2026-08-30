# frozen_string_literal: true

require 'dimples'

# The main website's class.
class UsesThis < Dimples::Site
  def initialize(config: {})
    super

    @config.build_paths[:api] = File.join(@config.build_paths[:root], 'api')
  end

  def prepare_output_directory
    super

    return if Dir.exist?(@config.build_paths[:api])

    Dir.mkdir(@config.build_paths[:api])
  end
end
