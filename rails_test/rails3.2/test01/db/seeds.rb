# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
3.times.each do | i |
  User.create(name: "user#{i}", email: "user#{i}@example.com")
  Item.create(name: "item#{i}")
end

items = Item.all.to_a
User.all.to_a.each do | user |
  user.items << items.sample
end
