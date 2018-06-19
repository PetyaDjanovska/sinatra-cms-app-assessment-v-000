class User < ActiveRecord::Base
  has_many :user_campsites
  has_many :campsites, through: :user_campsites
end
