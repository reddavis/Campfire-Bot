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
  bot.on(/^How are you?/) do
    bot.msg("Im very well thank-you")
  end
end.start