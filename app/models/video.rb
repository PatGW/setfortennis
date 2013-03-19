class Video < ActiveRecord::Base
  attr_accessible :description

  belongs_to :player
end
