class Item < ActiveRecord::Base
  has_many :users_items
  has_many :users, through: :users_items
end
