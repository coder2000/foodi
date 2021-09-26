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

ActiveRecord::Schema.define(version: 2021_09_26_234543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "ahoy_events", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time", precision: 6
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["properties"], name: "index_ahoy_events_on_properties", opclass: :jsonb_path_ops, using: :gin
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.bigint "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.string "app_version"
    t.string "os_version"
    t.string "platform"
    t.datetime "started_at", precision: 6
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at", precision: 6
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "households", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "subdomain"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "identities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "provider", null: false
    t.string "uid", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "locations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.uuid "household_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["household_id"], name: "index_locations_on_household_id"
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
    t.uuid "location_id"
    t.uuid "parent_id"
    t.uuid "store_id"
    t.uuid "purchase_unit_id"
    t.uuid "inventory_unit_id"
    t.uuid "household_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["household_id"], name: "index_products_on_household_id"
    t.index ["inventory_unit_id"], name: "index_products_on_inventory_unit_id"
    t.index ["location_id"], name: "index_products_on_location_id"
    t.index ["parent_id"], name: "index_products_on_parent_id"
    t.index ["purchase_unit_id"], name: "index_products_on_purchase_unit_id"
    t.index ["store_id"], name: "index_products_on_store_id"
  end

  create_table "products_receipts", id: false, force: :cascade do |t|
    t.uuid "receipt_id", null: false
    t.uuid "product_id", null: false
    t.index ["receipt_id", "product_id"], name: "index_products_receipts_on_receipt_id_and_product_id"
  end

  create_table "receipts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "purchased_at", precision: 6
    t.uuid "store_id"
    t.uuid "household_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["household_id"], name: "index_receipts_on_household_id"
    t.index ["store_id"], name: "index_receipts_on_store_id"
  end

  create_table "stores", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.uuid "household_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["household_id"], name: "index_stores_on_household_id"
  end

  create_table "supplies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "amount"
    t.datetime "purchased_at", precision: 6
    t.datetime "due_at", precision: 6
    t.datetime "opened_at", precision: 6
    t.uuid "product_id"
    t.uuid "location_id"
    t.uuid "store_id"
    t.uuid "household_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["household_id"], name: "index_supplies_on_household_id"
    t.index ["location_id"], name: "index_supplies_on_location_id"
    t.index ["product_id"], name: "index_supplies_on_product_id"
    t.index ["store_id"], name: "index_supplies_on_store_id"
  end

  create_table "units", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "plural"
    t.uuid "household_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["household_id"], name: "index_units_on_household_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: 6
    t.datetime "confirmation_sent_at", precision: 6
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at", precision: 6
    t.string "first_name"
    t.string "last_name"
    t.uuid "household_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 0
    t.string "slug"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["household_id"], name: "index_users_on_household_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "identities", "users"
end
