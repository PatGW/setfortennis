class Player < ActiveRecord::Base
  attr_accessible :about, :club, :first_name, :last_name, :profile_picture, :racket, :ranking, :image

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  has_many :videos

  has_one :user, :as => :tennis_player

end
