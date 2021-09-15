# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_15_200300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "locations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "barcode"
    t.integer "min_stock_amount", default: 0
    t.jsonb "photo_data"
    t.integer "default_due_days", default: 0
    t.integer "default_due_days_after_open", default: 0
    t.integer "default_due_days_after_freezing", default: 0
    t.integer "default_due_days_after_thawing", default: 0
    t.integer "due_type"
    t.boolean "can_be_frozen"
    t.integer "calories"
    t.decimal "tare_weight", precision: 10, scale: 2
    t.boolean "enable_tare_weight"
    t.boolean "active"
    t.integer "unit_ratio"
    t.bigint "location_id"
    t.bigint "parent_id"
    t.bigint "store_id"
    t.bigint "purchase_unit_id"
    t.bigint "inventory_unit_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inventory_unit_id"], name: "index_products_on_inventory_unit_id"
    t.index ["location_id"], name: "index_products_on_location_id"
    t.index ["parent_id"], name: "index_products_on_parent_id"
    t.index ["purchase_unit_id"], name: "index_products_on_purchase_unit_id"
    t.index ["store_id"], name: "index_products_on_store_id"
  end

  create_table "stores", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "supplies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "amount"
    t.datetime "purchased_at", precision: 6
    t.datetime "due_at", precision: 6
    t.datetime "opened_at", precision: 6
    t.bigint "product_id"
    t.bigint "location_id"
    t.bigint "store_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_supplies_on_location_id"
    t.index ["product_id"], name: "index_supplies_on_product_id"
    t.index ["store_id"], name: "index_supplies_on_store_id"
  end

  create_table "units", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "plural"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
