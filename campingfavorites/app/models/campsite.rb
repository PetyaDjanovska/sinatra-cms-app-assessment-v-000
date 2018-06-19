class Campsite < ActiveRecord::Base
  has_many :user_campsites
  has_many :users, through: :user_campsites
end
