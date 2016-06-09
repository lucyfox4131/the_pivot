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

ActiveRecord::Schema.define(version: 20160609013742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "category_families", force: :cascade do |t|
    t.integer  "family_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "category_families", ["category_id"], name: "index_category_families_on_category_id", using: :btree
  add_index "category_families", ["family_id"], name: "index_category_families_on_family_id", using: :btree

  create_table "families", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "arrival_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "num_married_adults"
    t.integer  "num_unmarried_adults"
    t.integer  "num_children_over_two"
    t.integer  "num_children_under_two"
    t.date     "donation_deadline"
    t.integer  "nationality_id"
  end

  add_index "families", ["nationality_id"], name: "index_families_on_nationality_id", using: :btree

  create_table "nationalities", force: :cascade do |t|
    t.string   "photo_path"
    t.string   "info_link"
    t.string   "greeting"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "supply_item_id"
    t.integer  "order_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["supply_item_id"], name: "index_order_items_on_supply_item_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "supplies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "value"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "multiplier_type"
  end

  create_table "supply_items", force: :cascade do |t|
    t.integer  "supply_id"
    t.integer  "family_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "supply_items", ["family_id"], name: "index_supply_items_on_family_id", using: :btree
  add_index "supply_items", ["supply_id"], name: "index_supply_items_on_supply_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "category_families", "categories"
  add_foreign_key "category_families", "families"
  add_foreign_key "families", "nationalities"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "supply_items"
  add_foreign_key "orders", "users"
  add_foreign_key "supply_items", "families"
  add_foreign_key "supply_items", "supplies"
end
