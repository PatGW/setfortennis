class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :password 
      t.references :tennis_player, :polymorphic => true
      t.timestamps
    end
  end
end
