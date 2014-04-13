class Item < ActiveRecord::Base
  attr_accessible :name
  has_many :user_items
  has_many :users, through: :user_items
end
