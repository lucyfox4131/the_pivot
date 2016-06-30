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

ActiveRecord::Schema.define(version: 20160630011020) do

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

  create_table "charities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "status"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "charity_admins", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "charity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "charity_admins", ["charity_id"], name: "index_charity_admins_on_charity_id", using: :btree
  add_index "charity_admins", ["user_id"], name: "index_charity_admins_on_user_id", using: :btree

  create_table "donation_items", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "supply_item_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "donation_id"
  end

  add_index "donation_items", ["donation_id"], name: "index_donation_items_on_donation_id", using: :btree
  add_index "donation_items", ["supply_item_id"], name: "index_donation_items_on_supply_item_id", using: :btree

  create_table "donations", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
  end

  add_index "donations", ["user_id"], name: "index_donations_on_user_id", using: :btree

  create_table "families", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "arrival_date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "num_married_adults"
    t.integer  "num_unmarried_adults"
    t.integer  "num_children_over_two"
    t.integer  "num_children_under_two"
    t.date     "donation_deadline"
    t.integer  "nationality_id"
    t.string   "description"
    t.string   "family_photo_file_name"
    t.string   "family_photo_content_type"
    t.integer  "family_photo_file_size"
    t.datetime "family_photo_updated_at"
    t.integer  "charity_id"
  end

  add_index "families", ["charity_id"], name: "index_families_on_charity_id", using: :btree
  add_index "families", ["nationality_id"], name: "index_families_on_nationality_id", using: :btree

  create_table "loan_items", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "loan_id"
    t.integer  "donation_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "loan_items", ["donation_id"], name: "index_loan_items_on_donation_id", using: :btree
  add_index "loan_items", ["loan_id"], name: "index_loan_items_on_loan_id", using: :btree

  create_table "loans", force: :cascade do |t|
    t.integer  "requested_amount"
    t.text     "description"
    t.string   "name"
    t.integer  "family_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "loans", ["family_id"], name: "index_loans_on_family_id", using: :btree

  create_table "nationalities", force: :cascade do |t|
    t.string   "photo_path"
    t.string   "info_link"
    t.string   "greeting"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role",            default: 0
    t.string   "cell"
    t.string   "email"
  end

  add_foreign_key "category_families", "categories"
  add_foreign_key "category_families", "families"
  add_foreign_key "charity_admins", "charities"
  add_foreign_key "charity_admins", "users"
  add_foreign_key "donation_items", "donations"
  add_foreign_key "donation_items", "supply_items"
  add_foreign_key "donations", "users"
  add_foreign_key "families", "charities"
  add_foreign_key "families", "nationalities"
  add_foreign_key "loan_items", "donations"
  add_foreign_key "loan_items", "loans"
  add_foreign_key "loans", "families"
  add_foreign_key "supply_items", "families"
  add_foreign_key "supply_items", "supplies"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
