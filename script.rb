#!/usr/bin/env ruby
# encoding: utf-8
require 'vkontakte_api'

=begin

follow next link:
http://oauth.vk.com/authorize?client_id=3135748&scope=messages,offline&redirect_uri=http://oauth.vk.com/blank.html&display=page&response_type=token

you'll be redirected to link like:
http://oauth.vk.com/blank.html#access_token=...&expires_in=0&user_id=...

supply access token and other user id to the script and run it

all messages will be saved to "dump" file

=end

def parse_response(response)
  1.upto(response.length-1) do |index|
    out = response[index].out
    body = response[index].body
    date = Time.at(response[2].date).to_date.strftime("%e.%m.%y")
    @file.write date + "\t" + ((out == 1) ? "Я:   \t" : "Юзер:\t")
    @file.puts body
  end
end

app_id = "3135748"
app_secret = "uvfQ7g5TraOPVVQkg016"
access_token = ''

other_user_id = ''

@vk = VkontakteApi::Client.new(access_token)

@file = File.open("dump", "w")
i = 0
while true do
  response = @vk.messages.get_history(uid: other_user_id, count: 200, offset: i, rev: 1)
  parse_response(response)
  if response.length < 201
    break
  end
  i += 200
end
@file.close