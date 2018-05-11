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

ActiveRecord::Schema.define(version: 2018_05_11_154245) do

  create_table "hits", force: :cascade do |t|
    t.integer "universal_resource_identifier_id"
    t.boolean "bot_hit"
    t.string "ip_address"
    t.string "http_referer"
    t.float "latitude"
    t.float "longitude"
    t.text "request_dump"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "browser"
    t.string "version"
    t.string "platform"
    t.index ["universal_resource_identifier_id"], name: "index_hits_on_universal_resource_identifier_id"
  end

  create_table "universal_resource_identifiers", force: :cascade do |t|
    t.text "long_url"
    t.string "short_url_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["long_url"], name: "index_universal_resource_identifiers_on_long_url", unique: true
    t.index ["short_url_id"], name: "index_universal_resource_identifiers_on_short_url_id", unique: true
  end

end
