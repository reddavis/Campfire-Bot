require "uri"
require "tinder"

module Campfire
  class Bot
    class << self
      def config(&block)
        new(&block)
      end
    end

    def initialize(&block)
      @events = []

      block.call(self) if block_given?
    end

    def login(&block)
      config = Config.new
      block.call(config)
      @campfire = Tinder::Campfire.new(config.subdomain, login_credentials(config)).find_room_by_name(config.room)
    end

    def start
      raise "You need to configure me" unless @campfire

      @campfire.listen do |line|
        evaluate(line) if line[:body]
      end
    end

    def on(regex, &block)
      @events << Event.new(regex, block)
    end

    def evaluate(message)
      if event = find_event(message[:body])
        event.action.call(@campfire, message)
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
      @events.find {|event| command.match(event.regex) }
    end
  end

  class Event < Struct.new(:regex, :action); end
  class Config < Struct.new(:username, :password, :subdomain, :room, :token); end
end