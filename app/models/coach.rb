class Coach < ActiveRecord::Base
  attr_accessible :about, :club, :first_name, :last_name, :profile_picture, :ranking

  has_one :user, :as => :tennis_player
end
