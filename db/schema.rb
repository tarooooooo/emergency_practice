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

ActiveRecord::Schema.define(version: 2024_07_31_000045) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "animals", force: :cascade do |t|
    t.string "species", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "breeds", force: :cascade do |t|
    t.integer "animal_id", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id", "name"], name: "index_breeds_on_animal_id_and_name", unique: true
    t.index ["animal_id"], name: "index_breeds_on_animal_id"
  end

  create_table "contests", force: :cascade do |t|
    t.integer "admin_id", null: false
    t.string "title", null: false
    t.text "description"
    t.datetime "starts_at", null: false
    t.datetime "ends_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_contests_on_admin_id"
  end

  create_table "entries", force: :cascade do |t|
    t.string "description"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "pet_id"
    t.integer "contest_id"
    t.index ["contest_id"], name: "index_entries_on_contest_id"
    t.index ["pet_id", "contest_id"], name: "index_entries_on_pet_id_and_contest_id", unique: true
    t.index ["pet_id"], name: "index_entries_on_pet_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "pets", force: :cascade do |t|
    t.integer "animal_id", null: false
    t.integer "breed_id", null: false
    t.integer "user_id", null: false
    t.string "name", null: false
    t.string "name_kana"
    t.integer "gender", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id"], name: "index_pets_on_animal_id"
    t.index ["breed_id"], name: "index_pets_on_breed_id"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
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

  create_table "votes", force: :cascade do |t|
    t.integer "entry_id", null: false
    t.integer "user_id", null: false
    t.integer "contest_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contest_id"], name: "index_votes_on_contest_id"
    t.index ["entry_id"], name: "index_votes_on_entry_id"
    t.index ["user_id", "contest_id"], name: "index_votes_on_user_id_and_contest_id", unique: true
    t.index ["user_id", "entry_id"], name: "index_votes_on_user_id_and_entry_id", unique: true
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "breeds", "animals"
  add_foreign_key "contests", "admins"
  add_foreign_key "entries", "contests"
  add_foreign_key "entries", "pets"
  add_foreign_key "entries", "users"
  add_foreign_key "pets", "animals"
  add_foreign_key "pets", "breeds"
  add_foreign_key "pets", "users"
  add_foreign_key "votes", "contests"
  add_foreign_key "votes", "entries"
  add_foreign_key "votes", "users"
end
