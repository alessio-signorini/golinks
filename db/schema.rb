# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_24_170856) do

  create_table "links", force: :cascade do |t|
    t.string "owner_type", null: false
    t.integer "owner_id", null: false
    t.string "description"
    t.string "path", null: false
    t.string "url", null: false
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"owner\", \"path\"", name: "index_links_on_owner_and_path"
    t.index ["owner_type", "owner_id"], name: "index_links_on_owner_type_and_owner_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_locations_on_organization_id"
  end

  create_table "network_addresses", force: :cascade do |t|
    t.integer "location_id", null: false
    t.string "name"
    t.string "address", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address"], name: "index_network_addresses_on_address"
    t.index ["location_id"], name: "index_network_addresses_on_location_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.string "logo_url"
    t.text "css"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "locations", "organizations"
  add_foreign_key "network_addresses", "locations"
end
