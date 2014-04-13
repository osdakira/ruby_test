class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :user_items
end
