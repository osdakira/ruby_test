class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :user_items
  has_many :items, through: :user_items

  def self.search(attr, query)
    where("`#{table_name}`.`#{attr}` LIKE ?", "%#{query}%")
  end
end
