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

ActiveRecord::Schema.define(version: 2018_12_03_213909) do

  create_table "agents", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apartments", force: :cascade do |t|
    t.string "unit_no"
    t.integer "size"
    t.integer "bedrooms"
    t.float "rent"
    t.boolean "electricity"
    t.boolean "water"
    t.boolean "gas"
    t.integer "lease_id"
    t.integer "building_id"
    t.integer "agent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_apartments_on_agent_id"
    t.index ["building_id"], name: "index_apartments_on_building_id"
    t.index ["lease_id"], name: "index_apartments_on_lease_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leases", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "exp_date"
    t.string "tenant_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
