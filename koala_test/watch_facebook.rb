# -*- coding: utf-8 -*-
require "koala"
require "mail"

ACCESS_TOKEN = ARGV[0]
GROUP_ID = ARGV[1]
USER_NAME = ARGV[2]
PASSWORD = ARGV[3]
EMAILS = ARGV[4..-1]

begin
  load "config.rb"
rescue LoadError
end

puts "access facebook ..."
graph = Koala::Facebook::API.new(ACCESS_TOKEN)
feeds = graph.get_connections(GROUP_ID, "feed")

puts "reject already feeds ..."
already_feeds_file = open("already_feeds.txt", "a+")
already_read_ids = already_feeds_file.readlines.map(&:chomp)
new_feeds = feeds.reject{|f| already_read_ids.include?(f["id"]) }

exit if new_feeds.size == 0

puts "create messages ..."
messages = new_feeds.map do |f|
  <<-EOS
  #{f["from"]["name"]}
  #{f["message"][0..100]}...
  #{'-' * 50}
  EOS
end
messages << "https://www.facebook.com/groups/#{GROUP_ID}/"

puts "send mail new feeds ..."
mail = Mail.new do
  from    'no-reply@example.com'
  to      EMAILS.join(",")
  subject 'Bug Report'
  body    messages.join("\n")
end
mail.charset = 'utf-8'
mail.delivery_method :smtp, {
  address:   'smtp.gmail.com',
  port:      587,
  domain:    'smtp.gmail.com',
  user_name: USER_NAME,
  password:  PASSWORD
}
mail.deliver!

puts "store feed_ids (#{new_feeds.size}) ..."
already_feeds_file.puts(new_feeds.map{|f| f["id"]})
already_feeds_file.close
