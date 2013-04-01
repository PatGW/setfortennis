class AddImageToPlayers < ActiveRecord::Migration
   def self.up
    add_attachment :players, :image
  end

  def self.down
    remove_attachment :players, :image
  end
end
