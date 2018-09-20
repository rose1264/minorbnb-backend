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

ActiveRecord::Schema.define(version: 2018_09_20_170104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
  end

  create_table "listings", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "address"
    t.string "description"
    t.integer "host_id"
    t.integer "neighbourhood_id"
  end

  create_table "neighbourhoods", force: :cascade do |t|
    t.string "name"
    t.integer "city_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "check_in"
    t.date "check_out"
    t.integer "guest_number"
    t.integer "guest_id"
    t.integer "listing_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "description"
    t.integer "guest_id"
    t.integer "reservation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
