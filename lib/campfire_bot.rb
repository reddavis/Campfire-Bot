$:.unshift(File.expand_path(File.dirname(__FILE__)))
require 'campfire_bot/bot'

$bot = Campfire::Bot.new

%w(on config msg).each do |method|
  eval(<<-EOF)
    def #{method}(*args, &block)
      $bot.#{method}(*args, &block)
    end
  EOF
end

at_exit do
  unless defined?(Rspec)
    raise $! if $!
    $bot.start
  end
end