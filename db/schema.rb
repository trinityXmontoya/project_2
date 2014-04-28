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

ActiveRecord::Schema.define(version: 20140428211352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auctions", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "location"
    t.string   "title"
    t.text     "description"
    t.datetime "time_limit"
    t.boolean  "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "bids", force: true do |t|
    t.integer  "user_id"
    t.integer  "auction_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string "title"
    t.string "description"
    t.string "badge_photo"
  end

  create_table "messages", force: true do |t|
    t.integer  "bid_id"
    t.integer  "auction_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pokemons", force: true do |t|
    t.string  "name"
    t.integer "pokedex_id"
    t.string  "img_url"
    t.string  "poke_type"
    t.integer "hp_level"
    t.integer "attack_level"
    t.integer "defense_level"
    t.integer "spattack_level"
    t.integer "spdefense_level"
    t.integer "speed_level"
    t.string  "classification"
    t.string  "height"
    t.decimal "weight",          precision: 6, scale: 2
  end

  create_table "users", id: false, force: true do |t|
    t.integer  "id"
    t.string   "oauth_token"
    t.string   "name"
    t.string   "profile_photo"
    t.string   "location"
    t.string   "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["id"], name: "index_users_on_id", unique: true, using: :btree

end
