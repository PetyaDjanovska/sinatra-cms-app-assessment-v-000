class Campsite < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :user_campsites
  has_many :users, through: :user_campsites
end
