# -*- coding: utf-8 -*-
require "koala"

ACCESS_TOKEN = ENV['ACCESS_TOKEN']
GROUP_ID = ENV['GROUP_ID']

puts "access facebook ..."
graph = Koala::Facebook::API.new(ACCESS_TOKEN)
feeds = graph.get_connections(GROUP_ID, "feed")

puts "reject already feeds"
already_feeds_file = open("already_feeds.txt", "a+")
already_read_ids = already_feeds_file.readlines.map(&:chomp)

new_feeds = feeds.reject{|f| already_read_ids.include?(f["id"]) }

puts "send mail new feeds"
messages = new_feeds.map do |f|
  <<-EOS
  #{f["from"]["name"]}
  #{f["message"][0..100]}...
  #{'-' * 50}
  EOS
end
messages << "https://www.facebook.com/groups/#{GROUP_ID}/"

EMAILS = ["a.osada@mugenup.com"]
IO.popen("mail -s 'Bug Report' #{EMAILS.join(" ")}", "r+") do |io|
  io.puts messages
end

puts "store feed_ids (#{new_feeds.size})"
already_feeds_file.puts(new_feeds.map{|f| f["id"]})
already_feeds_file.close
