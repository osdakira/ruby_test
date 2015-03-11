class User < ActiveRecord::Base
  has_many :users_items
  has_many :items, through: :users_items
end
