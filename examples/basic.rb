require 'rubygems'
require File.expand_path(File.dirname(__FILE__) + "/../lib/campfire_bot")

Campfire::Bot.config do |bot|
  # Login
  bot.login do |l|
    l.username = "username"
    l.password = "password"
    l.subdomain = "subdomain"
    l.room = "room"
  end

  # Events
  bot.on(/^How are you?/) do |room, message|
    room.speak("Im very sad thank-you")
    room.play("trombone")
    room.paste("This is a paste")
    room.upload("/path/to/file.jpg")
  end
end.start