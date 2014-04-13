class UserItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  attr_accessible :number
end
