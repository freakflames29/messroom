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

ActiveRecord::Schema.define(version: 2022_06_23_135800) do

  create_table "active_storage_attachments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", force: :cascade do |t|
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

  create_table "active_storage_variant_records", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "contacts", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messes", charset: "utf8mb4", force: :cascade do |t|
    t.integer "price"
    t.string "city"
    t.string "state"
    t.string "adrs"
    t.string "pincode"
    t.string "landmark"
    t.text "description"
    t.boolean "service_boys_only", default: false
    t.boolean "service_girls_only", default: false
    t.boolean "student_boys_only", default: false
    t.boolean "student_girls_only", default: false
    t.boolean "for_all", default: false
    t.boolean "room_available", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_messes_on_user_id"
  end

  create_table "pins", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "randomdbs", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "location"
    t.string "mtype"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ratings", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "mess_id", null: false
    t.integer "rating", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mess_id"], name: "index_ratings_on_mess_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "reviews", charset: "utf8mb4", force: :cascade do |t|
    t.text "body"
    t.bigint "mess_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mess_id"], name: "index_reviews_on_mess_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.string "phone"
    t.string "gender"
    t.string "city"
    t.string "state"
    t.string "address"
    t.string "pincode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "adh", default: "000000000000"
    t.boolean "is_owner", default: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "messes", "users"
  add_foreign_key "ratings", "messes"
  add_foreign_key "ratings", "users"
  add_foreign_key "reviews", "messes"
  add_foreign_key "reviews", "users"
end
