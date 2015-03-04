$:.unshift(__dir__)

require 'dimples'

require 'usesthis/site'
require 'usesthis/interview'
require 'usesthis/link'
require 'usesthis/ware'

Tilt.register Tilt::RedcarpetTemplate, 'interview'