$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

## Need some more tests ##

require 'rubygems'
require 'campfire_bot'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|

end
