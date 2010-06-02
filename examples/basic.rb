require 'rubygems'
require File.expand_path(File.dirname(__FILE__) + "/../lib/campfire_bot")

config do |c|
  c.username = "username"
  c.password = "password"
  c.subdomain = "subdomain"
  c.room = "room"
end

on(/^hello/) do
  msg("Hello to you to")
end