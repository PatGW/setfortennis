class Video < ActiveRecord::Base
  attr_accessible :description, :link

  belongs_to :player

  validates_presence_of :link
  validates_presence_of :description


end
