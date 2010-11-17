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
      bot.on(/^How are you?/) do |room, message|
        room.speak("Im very sad thank-you")
        room.play("trombone")
        room.paste("This is a paste")
        room.upload("/path/to/file.jpg")
      end
    end.start

Message object gives you a hash of details about the message

    {
      "room_id" => 123456,
      "created_at" => Wed Nov 17 20:06:44 +0000 2010,
      "body" => "!go",
      "id" => 12345,
      "type" => "TextMessage",
      "user" => {
        "name" => "Red",
        "created_at" => Tue Nov 16 13:48:19 +0000 2010,
        "admin" => true,
        "id" => 1111,
        "type" => "Member",
        "email_address" => "red@railslove.com"
      }
    }

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
