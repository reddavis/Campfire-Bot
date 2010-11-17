require "uri"
require "tinder"

module Campfire
  class Bot
    VERSION = "0.0.3"

    class << self
      def config
        @bot = new
        yield(@bot)
        @bot
      end
    end

    def initialize
      @events = []
    end

    def login(&block)
      config = Config.new
      block.call(config)
      @campfire = Tinder::Campfire.new(config.subdomain, login_credentials(config)).find_room_by_name(config.room)
    end

    def start
      raise "You need to configure me" unless @campfire
      @campfire.listen do |line|
        evaluate(line[:body]) if line[:body]
      end
    end

    def msg(text)
      @campfire.speak(text)
    end

    def on(regex, &block)
      @events << Event.new(regex, block)
    end

    def evaluate(message)
      if event = find_event(message)
        event.action.call
      end
    end

    private

    def login_credentials(config)
      if config.token
        { :token => config.token }
      else
        { :username => config.username, :password => config.password }
      end
    end

    def find_event(command)
      @events.find {|event| command.match(event.regex)}
    end
  end

  class Event < Struct.new(:regex, :action); end
  class Config < Struct.new(:username, :password, :subdomain, :room, :token); end
end