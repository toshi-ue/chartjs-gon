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

ActiveRecord::Schema.define(version: 20190325213051) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "postalcode",       limit: 4
    t.string   "name",             limit: 255
    t.boolean  "current_address"
    t.boolean  "delivery_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "cartitems", force: :cascade do |t|
    t.integer  "quantity",   limit: 4
    t.integer  "item_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "order_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cartitems", ["order_id"], name: "index_cartitems_on_order_id", using: :btree
  add_index "cartitems", ["user_id"], name: "index_cartitems_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "price",          limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subcategory_id", limit: 4
  end

  add_index "items", ["subcategory_id"], name: "index_items_on_subcategory_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "amount",     limit: 4
    t.integer  "address_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["address_id"], name: "index_orders_on_address_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "subcategories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "category_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.time     "withdrawal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "cartitems", "orders"
  add_foreign_key "cartitems", "users"
  add_foreign_key "items", "subcategories"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "users"
  add_foreign_key "subcategories", "categories"
end
