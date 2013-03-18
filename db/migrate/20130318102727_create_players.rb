class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :profile_picture
      t.string :ranking
      t.string :racket
      t.text :about
      t.string :club

      t.timestamps
    end
  end
end
