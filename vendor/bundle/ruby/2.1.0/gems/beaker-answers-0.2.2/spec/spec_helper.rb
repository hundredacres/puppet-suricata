require 'simplecov'
require 'beaker-answers'
require 'helpers'

require 'rspec/its'

RSpec.configure do |config|
  config.include TestFileHelpers
  config.include HostHelpers
end
