class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :user_items
  has_many :items, through: :user_items
end
