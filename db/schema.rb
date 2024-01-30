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

ActiveRecord::Schema[7.1].define(version: 2024_01_30_080913) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "restaurante_id", null: false
    t.string "rte_role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurante_id"], name: "index_members_on_restaurante_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "qty_measurement", precision: 10
    t.string "unit_measurement"
    t.text "description"
    t.decimal "buying_cost_pck", precision: 10
    t.decimal "buying_cost_unit", precision: 10
    t.decimal "selling_cost_pck", precision: 10
    t.decimal "selling_cost_unit", precision: 10
    t.decimal "production_cost", precision: 10
    t.decimal "qty_to_stock", precision: 10
    t.decimal "qty_in_stock", precision: 10
    t.string "current_stock_value"
    t.string "created_by"
    t.bigint "restaurante_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurante_id"], name: "index_products_on_restaurante_id"
  end

  create_table "restaurantes", force: :cascade do |t|
    t.string "name"
    t.string "address_1"
    t.string "address_2"
    t.string "post_code"
    t.string "email"
    t.string "telephone"
    t.string "mobile"
    t.string "VAT"
    t.integer "NIT"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tables", force: :cascade do |t|
    t.string "number"
    t.bigint "restaurante_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurante_id"], name: "index_tables_on_restaurante_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "role", default: ""
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "members", "restaurantes"
  add_foreign_key "members", "users"
  add_foreign_key "products", "restaurantes"
  add_foreign_key "tables", "restaurantes"
end
