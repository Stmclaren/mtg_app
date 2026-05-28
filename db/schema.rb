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

ActiveRecord::Schema[8.1].define(version: 2026_05_22_133434) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "ai_recommendations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "deck_id", null: false
    t.jsonb "metadata"
    t.bigint "profile_id", null: false
    t.text "prompt"
    t.text "response"
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_ai_recommendations_on_deck_id"
    t.index ["profile_id"], name: "index_ai_recommendations_on_profile_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "card_type"
    t.integer "collector_number"
    t.string "colour"
    t.datetime "created_at", null: false
    t.string "image_url"
    t.string "legal_formats"
    t.integer "mana_value"
    t.string "name"
    t.string "rarity"
    t.string "set"
    t.datetime "updated_at", null: false
  end

  create_table "collection_entries", force: :cascade do |t|
    t.bigint "card_id", null: false
    t.bigint "collection_id", null: false
    t.datetime "created_at", null: false
    t.boolean "foil"
    t.integer "quantity"
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_collection_entries_on_card_id"
    t.index ["collection_id"], name: "index_collection_entries_on_collection_id"
  end

  create_table "collections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.string "name"
    t.bigint "profile_id", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_collections_on_profile_id"
  end

  create_table "deck_cards", force: :cascade do |t|
    t.bigint "card_id", null: false
    t.datetime "created_at", null: false
    t.bigint "deck_id", null: false
    t.integer "quantity"
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_deck_cards_on_card_id"
    t.index ["deck_id"], name: "index_deck_cards_on_deck_id"
  end

  create_table "decks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.string "format"
    t.string "name"
    t.bigint "profile_id", null: false
    t.boolean "public"
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_decks_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address"
    t.string "first_name"
    t.string "last_name"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ai_recommendations", "decks"
  add_foreign_key "ai_recommendations", "profiles"
  add_foreign_key "collection_entries", "cards"
  add_foreign_key "collection_entries", "collections"
  add_foreign_key "collections", "profiles"
  add_foreign_key "deck_cards", "cards"
  add_foreign_key "deck_cards", "decks"
  add_foreign_key "decks", "profiles"
  add_foreign_key "profiles", "users"
end
