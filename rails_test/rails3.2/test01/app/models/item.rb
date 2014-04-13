class Item < ActiveRecord::Base
  attr_accessible :name
  has_many :user_items
end
