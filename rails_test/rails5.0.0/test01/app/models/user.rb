class User < ApplicationRecord
  attr_accessor :admin

  def admin?
    !!@admin
  end
end
