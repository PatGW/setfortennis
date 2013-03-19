class Player < ActiveRecord::Base
  attr_accessible :about, :club, :first_name, :last_name, :profile_picture, :racket, :ranking

  has_many :videos

end
