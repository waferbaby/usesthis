$LOAD_PATH.unshift(__dir__)

require 'oj'

require 'usesthis/api'
require 'usesthis/site'
require 'usesthis/interview'
require 'usesthis/link'
require 'usesthis/ware'

Oj.default_options = { mode: :compat }