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

ActiveRecord::Schema.define(version: 20140428150546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: true do |t|
    t.string "name"
    t.date   "date_of_birth"
    t.string "image_url"
  end

  create_table "apartments", id: false, force: true do |t|
    t.integer "id",          null: false
    t.integer "floor"
    t.string  "name"
    t.integer "price"
    t.integer "sqft"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.integer "building_id"
  end

  create_table "artists", force: true do |t|
    t.string "name"
    t.string "nationality"
    t.date   "date_of_birth"
  end

  create_table "auctions", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "location"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bids", force: true do |t|
    t.integer  "user_id"
    t.integer  "auction_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buildings", id: false, force: true do |t|
    t.integer "id",         null: false
    t.string  "name"
    t.string  "address"
    t.integer "num_floors"
  end

  create_table "categories", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "badge_photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", force: true do |t|
    t.string  "name"
    t.string  "house"
    t.string  "weapon"
    t.integer "favor"
  end

  create_table "customers", id: false, force: true do |t|
    t.integer "customer_id"
    t.string  "customer_name"
    t.string  "color_of_shirt"
    t.integer "money_spent"
  end

  create_table "dogs", force: true do |t|
    t.string  "name"
    t.date    "date_of_birth"
    t.string  "image_url"
    t.integer "animal_id"
  end

  create_table "doormen", id: false, force: true do |t|
    t.integer "id",          null: false
    t.string  "name"
    t.integer "experience"
    t.string  "shift"
    t.integer "building_id"
  end

  create_table "foods", id: false, force: true do |t|
    t.integer "food_id"
    t.string  "name"
    t.integer "price"
  end

  create_table "games", force: true do |t|
    t.date   "date"
    t.string "title"
    t.string "venue"
  end

  create_table "games_players", id: false, force: true do |t|
    t.integer "playlist_id"
    t.integer "song_id"
  end

  create_table "messages", force: true do |t|
    t.integer  "bid_id"
    t.integer  "auction_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paintings", force: true do |t|
    t.string  "title"
    t.integer "year"
    t.string  "image_url"
    t.integer "artist_id"
  end

  create_table "players", force: true do |t|
    t.string "name"
    t.string "jersey"
  end

  create_table "tenants", id: false, force: true do |t|
    t.integer "id",           null: false
    t.string  "name"
    t.integer "age"
    t.string  "gender"
    t.integer "apartment_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "photo"
    t.string   "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
