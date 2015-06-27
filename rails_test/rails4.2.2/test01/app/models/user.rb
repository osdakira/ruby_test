class User < ActiveRecord::Base

  scope :scope_A, -> { where(bust: 72..74) }
  scope :scope_B, -> { where(waist: 58..60) }
  scope :scope_C, -> { where(hip: 87..90) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :async
end
