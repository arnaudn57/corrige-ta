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

ActiveRecord::Schema.define(version: 2022_01_04_162032) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "computer_personas", force: :cascade do |t|
    t.string "name"
    t.text "url"
    t.string "gender"
    t.string "hat_color"
    t.string "hair_color"
    t.string "hair_length"
    t.string "eyes"
    t.string "nose"
    t.string "mustache"
    t.string "beard"
    t.string "face_shape"
    t.string "glasses"
    t.string "earrings"
    t.string "face_color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "computer_persona_id", null: false
    t.bigint "user_persona_id", null: false
    t.bigint "persona_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "winner", default: ["pending"], array: true
    t.index ["computer_persona_id"], name: "index_games_on_computer_persona_id"
    t.index ["persona_id"], name: "index_games_on_persona_id"
    t.index ["user_id"], name: "index_games_on_user_id"
    t.index ["user_persona_id"], name: "index_games_on_user_persona_id"
  end

  create_table "personas", force: :cascade do |t|
    t.string "name"
    t.text "url"
    t.string "gender"
    t.string "hat_color"
    t.string "hair_color"
    t.string "hair_length"
    t.string "eyes"
    t.string "nose"
    t.string "mustache"
    t.string "beard"
    t.string "face_shape"
    t.string "glasses"
    t.string "earrings"
    t.string "face_color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "user_feature"
    t.string "user_adjective"
    t.string "user_validation"
    t.string "computer_feature"
    t.string "computer_adjective"
    t.string "computer_validation"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_rounds_on_game_id"
  end

  create_table "user_personas", force: :cascade do |t|
    t.string "name"
    t.text "url"
    t.string "gender"
    t.string "hat_color"
    t.string "hair_color"
    t.string "hair_length"
    t.string "eyes"
    t.string "nose"
    t.string "mustache"
    t.string "beard"
    t.string "face_shape"
    t.string "glasses"
    t.string "earrings"
    t.string "face_color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  add_foreign_key "games", "computer_personas"
  add_foreign_key "games", "personas"
  add_foreign_key "games", "user_personas"
  add_foreign_key "games", "users"
  add_foreign_key "rounds", "games"
end
