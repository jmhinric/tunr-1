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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140225015658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: true do |t|
    t.string "name"
    t.text   "photo_url"
    t.string "genre"
  end

  create_table "playlist_purchases", force: true do |t|
    t.integer "playlist_id"
    t.integer "purchase_id"
  end

  create_table "playlist_users", force: true do |t|
    t.integer "user_id"
    t.integer "playlist_id"
    t.integer "creator_id"
  end

  create_table "playlists", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", force: true do |t|
    t.integer "song_id"
    t.integer "user_id"
  end

  create_table "songs", force: true do |t|
    t.string  "title"
    t.integer "year"
    t.integer "artist_id"
    t.text    "preview_url"
    t.decimal "price",       default: 1.99
  end

  create_table "users", force: true do |t|
    t.string  "email"
    t.string  "first_name"
    t.string  "last_name"
    t.date    "dob"
    t.string  "gender"
    t.string  "facebook_link"
    t.string  "password_digest"
    t.decimal "balance",         default: 0.0
  end

end
