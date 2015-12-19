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

ActiveRecord::Schema.define(version: 20151219162638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "bookings", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "lastname"
    t.integer  "house_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "accepted",   default: false
    t.text     "message"
    t.string   "firstname"
    t.string   "email"
    t.string   "phone"
    t.string   "gender"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "costs", force: true do |t|
    t.string   "name"
    t.string   "ctype"
    t.integer  "amount"
    t.boolean  "optional"
    t.integer  "pricing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "place_id"
  end

  create_table "details", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facilities", force: true do |t|
    t.string   "name"
    t.string   "activated"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "detail_id"
  end

  create_table "facilities_houses", id: false, force: true do |t|
    t.integer "facility_id", null: false
    t.integer "house_id",    null: false
  end

  create_table "houses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "size"
    t.integer  "n_people"
    t.integer  "add_n_people"
    t.boolean  "activated",         default: false
    t.string   "htype"
    t.integer  "location_id"
    t.string   "movie_url"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "short_description"
  end

  create_table "houses_suits", id: false, force: true do |t|
    t.integer "house_id", null: false
    t.integer "suit_id",  null: false
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "houses_count", default: 0
    t.integer  "region_id"
  end

  create_table "page_configs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.string   "page_config_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
  end

  create_table "periods", force: true do |t|
    t.date     "from"
    t.date     "to"
    t.integer  "min"
    t.string   "min_type"
    t.integer  "cost_per_night"
    t.integer  "cost_per_week"
    t.integer  "pricing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "season"
    t.string   "ptype"
  end

  create_table "pictures", force: true do |t|
    t.integer  "house_id"
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "default_pic"
    t.text     "description"
  end

  create_table "places", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pricings", force: true do |t|
    t.integer  "n_people"
    t.integer  "surcharge_night"
    t.integer  "surcharge_week"
    t.integer  "house_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
    t.integer  "houses_count", default: 0
  end

  create_table "suits", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activated",  default: "Ja"
    t.integer  "detail_id"
  end

end
