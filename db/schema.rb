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

ActiveRecord::Schema.define(version: 2018_07_26_143411) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.integer "bank_id", null: false
    t.string "acct_id", null: false
    t.string "acct_name"
    t.string "bank_name"
    t.index ["acct_id"], name: "index_bank_accounts_on_acct_id", unique: true
    t.index ["bank_id", "acct_id"], name: "index_bank_accounts_on_bank_id_and_acct_id", unique: true
    t.index ["bank_name", "acct_id"], name: "index_bank_accounts_on_bank_name_and_acct_id", unique: true
    t.index ["bank_name", "acct_name"], name: "index_bank_accounts_on_bank_name_and_acct_name", unique: true
  end

  create_table "moon_phases", force: :cascade do |t|
    t.string "phase", null: false
    t.date "date", null: false
    t.time "time", null: false
    t.string "date_raw", null: false
    t.string "time_raw", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date", "time"], name: "index_moon_phases_on_date_and_time", unique: true
  end

  create_table "statements", force: :cascade do |t|
    t.string "transaction_type", null: false
    t.decimal "transaction_amt", precision: 8, scale: 2
    t.string "name", null: false
    t.date "date_posted"
    t.text "memo"
    t.integer "bank_account_id"
    t.integer "fit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_account_id"], name: "index_statements_on_bank_account_id"
    t.index ["date_posted"], name: "index_statements_on_date_posted"
    t.index ["transaction_type", "date_posted"], name: "index_statements_on_transaction_type_and_date_posted"
  end

  create_table "user_bank_accounts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bank_account_id"
    t.index ["bank_account_id"], name: "index_user_bank_accounts_on_bank_account_id"
    t.index ["user_id"], name: "index_user_bank_accounts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
