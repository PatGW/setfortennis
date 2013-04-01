# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130401130820) do

  create_table "coaches", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_picture"
    t.string   "ranking"
    t.string   "about"
    t.string   "club"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "comments", :force => true do |t|
    t.string   "feedback"
    t.integer  "coach_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_picture"
    t.string   "ranking"
    t.string   "racket"
    t.text     "about"
    t.string   "club"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "imageo_file_name"
    t.string   "imageo_content_type"
    t.integer  "imageo_file_size"
    t.datetime "imageo_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "password"
    t.integer  "tennis_player_id"
    t.string   "tennis_player_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "videos", :force => true do |t|
    t.string   "description"
    t.string   "link"
    t.integer  "player_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
