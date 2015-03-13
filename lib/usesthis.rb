$:.unshift(__dir__)

require 'dimples'

require 'usesthis/site'
require 'usesthis/interview'
require 'usesthis/link'
require 'usesthis/ware'

require 'oj'

Oj.default_options = {mode: :compat}
Tilt.register Tilt::RedcarpetTemplate, 'interview'