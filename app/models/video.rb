class Video < ActiveRecord::Base
  attr_accessible :description, :link

  belongs_to :player
end
