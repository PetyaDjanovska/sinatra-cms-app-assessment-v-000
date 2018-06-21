class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true
  has_many :user_campsites
  has_many :campsites, through: :user_campsites
end
