class UserCampsite < ActiveRecord::Base
  belongs_to :user
  belongs_to :campsite
end
