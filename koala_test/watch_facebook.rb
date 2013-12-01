# -*- coding: utf-8 -*-
require "koala"
require "sqlite3"

ACCESS_TOKEN = ENV['ACCESS_TOKEN']

GROUP_ID = ENV['GROUP_ID']

puts "access facebook ..."
graph = Koala::Facebook::API.new(ACCESS_TOKEN)
# group = graph.get_object(GROUP_ID)
feeds = graph.get_connections(GROUP_ID, "feed")

puts "reject already feeds"
TABLE_NAME = "feeds"
COLUMN_NAME = "feed_id"

# TODO プレースホルダが使えない
# db.execute("CREATE TABLE ? (?)", [TABLE_NAME, COLUMN_NAME])
db = SQLite3::Database.new("feeds.db")
if db.table_info(TABLE_NAME).size == 0
  db.execute("CREATE TABLE #{TABLE_NAME} (#{COLUMN_NAME})")
end

already_read_ids = db.execute("SELECT #{COLUMN_NAME} FROM #{TABLE_NAME}").flatten

new_feeds = feeds.reject{|f| f["id"] == already_read_ids}

puts "send mail new feeds"
messages = new_feeds.map{|f| "#{f["from"]["name"]}\n#{f["message"][0..100]}"}
messages = messages.join("...\n\n#{'-' * 50}\n\n")

EMAILS = ["a.osada@mugenup.com"]
emails = EMAILS.join(" ")

IO.popen("mail -s 'Bug Report' #{emails}", "r+") do |io|
  io.puts messages
  io.close_write
end

puts "store feed_ids"
new_feeds.each do |f|
  db.execute("INSERT INTO #{TABLE_NAME} (#{COLUMN_NAME}) VALUES('#{f["id"]}')")
end
db.close
