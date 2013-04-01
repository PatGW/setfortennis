class AddAttachmentImageoToPlayers < ActiveRecord::Migration
  def self.up
    change_table :players do |t|
      t.attachment :imageo
    end
  end

  def self.down
    drop_attached_file :players, :imageo
  end
end
