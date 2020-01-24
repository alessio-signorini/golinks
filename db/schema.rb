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

ActiveRecord::Schema.define(version: 2020_01_24_070348) do

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "hostname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hostname"], name: "index_clients_on_hostname"
  end

  create_table "network_addresses", force: :cascade do |t|
    t.integer "client_id", null: false
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id", "address"], name: "index_network_addresses_on_client_id_and_address"
    t.index ["client_id"], name: "index_network_addresses_on_client_id"
  end

  create_table "redirects", force: :cascade do |t|
    t.integer "client_id", null: false
    t.string "path"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id", "path"], name: "index_redirects_on_client_id_and_path"
    t.index ["client_id"], name: "index_redirects_on_client_id"
  end

  add_foreign_key "network_addresses", "clients"
  add_foreign_key "redirects", "clients"
end
