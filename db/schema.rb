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

ActiveRecord::Schema.define(version: 2021_07_30_211816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.string "title"
    t.integer "rarity"
    t.string "weapon"
    t.string "element"
    t.string "birthday"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "slot_1s", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_slot_1s_on_character_id"
  end

  create_table "slot_2s", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_slot_2s_on_character_id"
  end

  create_table "slot_3s", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_slot_3s_on_character_id"
  end

  create_table "slot_4s", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_slot_4s_on_character_id"
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "slot_1_id", null: false
    t.bigint "slot_2_id", null: false
    t.bigint "slot_3_id", null: false
    t.bigint "slot_4_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slot_1_id"], name: "index_teams_on_slot_1_id"
    t.index ["slot_2_id"], name: "index_teams_on_slot_2_id"
    t.index ["slot_3_id"], name: "index_teams_on_slot_3_id"
    t.index ["slot_4_id"], name: "index_teams_on_slot_4_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "slot_1s", "characters"
  add_foreign_key "slot_2s", "characters"
  add_foreign_key "slot_3s", "characters"
  add_foreign_key "slot_4s", "characters"
  add_foreign_key "teams", "slot_1s"
  add_foreign_key "teams", "slot_2s"
  add_foreign_key "teams", "slot_3s"
  add_foreign_key "teams", "slot_4s"
end
