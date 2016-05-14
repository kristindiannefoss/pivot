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

ActiveRecord::Schema.define(version: 20160514181341) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string  "name"
    t.integer "need_id"
  end

  add_index "categories", ["need_id"], name: "index_categories_on_need_id", using: :btree

  create_table "donation_amount", force: :cascade do |t|
    t.integer "donation_id"
    t.integer "need_id"
    t.integer "quantity"
  end

  add_index "donation_amount", ["donation_id"], name: "index_donation_amount_on_donation_id", using: :btree
  add_index "donation_amount", ["need_id"], name: "index_donation_amount_on_need_id", using: :btree

  create_table "donation_amounts", force: :cascade do |t|
    t.integer "need_id"
    t.integer "donation_id"
    t.integer "quantity"
  end

  add_index "donation_amounts", ["donation_id"], name: "index_donation_amounts_on_donation_id", using: :btree
  add_index "donation_amounts", ["need_id"], name: "index_donation_amounts_on_need_id", using: :btree

  create_table "donations", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
  end

  add_index "donations", ["user_id"], name: "index_donations_on_user_id", using: :btree

  create_table "need_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "cost"
    t.string   "image_url"
    t.string   "slug"
    t.string   "category"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "max",         default: 5
  end

  create_table "needs", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "cost"
    t.integer  "raised",      default: 0
    t.string   "image_url"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "slug"
    t.integer  "user_id"
    t.integer  "category_id"
  end

  add_index "needs", ["category_id"], name: "index_needs_on_category_id", using: :btree
  add_index "needs", ["user_id"], name: "index_needs_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.string  "city"
    t.string  "password_digest"
    t.integer "role",            default: 0
    t.string  "country"
    t.string  "username"
    t.string  "image_url"
    t.text    "description"
  end

  add_foreign_key "categories", "needs"
  add_foreign_key "donation_amount", "donations"
  add_foreign_key "donation_amount", "needs"
  add_foreign_key "donation_amounts", "donations"
  add_foreign_key "donation_amounts", "needs"
  add_foreign_key "donations", "users"
  add_foreign_key "needs", "categories"
  add_foreign_key "needs", "users"
end
