class Comments < ActiveRecord::Base
  attr_accessible :feedback

  belongs_to :video
end
