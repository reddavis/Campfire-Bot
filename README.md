# Campfire Bot

This is a Campfire bot heavily inspired by http://github.com/ichverstehe/isaac

## How To Install

    sudo gem install campfire_bot

## How To Use

    require "rubygems"
    require "campfire_bot"

    Campfire::Bot.config do |bot|
      # Login
      bot.login do |l|
        l.username = "username"
        l.password = "password"
        l.subdomain = "subdomain"
        l.room = "room"

        ## or
        # l.token = "XXX"
        ##
      end

      # Events
      bot.on(/^How are you?/) do |x|
        x.msg("Im very well thank-you")
      end
    end.start

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Red Davis. See LICENSE for details.
