$:.unshift(File.dirname(__FILE__))
$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require "campfire_bot"
require "rspec"

RSpec.configure do |config|
end