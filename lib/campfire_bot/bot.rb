require "tinder"

module Campfire
  class Bot
    def initialize
      @events = []
    end

    def config(&block)
      config = Config.new
      block.call(config)
      @campfire = Tinder::Campfire.new(config.subdomain, :username => config.username, :password => config.password).find_room_by_name(config.room)
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

    def find_event(command)
      @events.find {|event| command.match(event.regex)}
    end
  end

  class Event < Struct.new(:regex, :action); end
  class Config < Struct.new(:username, :password, :subdomain, :room); end
end