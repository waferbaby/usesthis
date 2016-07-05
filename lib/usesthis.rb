$LOAD_PATH.unshift(__dir__)

require 'rubygems'
require 'bundler/setup'

require 'dimples'
require 'oj'
require 'redis'

require 'usesthis/site'
require 'usesthis/interview'
require 'usesthis/link'
require 'usesthis/ware'

Oj.default_options = { mode: :compat }

module UsesThis
  API_VERSION = '1'.freeze
end