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

ActiveRecord::Schema.define(version: 20180809065401) do

  create_table "book_types", force: :cascade do |t|
    t.string   "book_name",    limit: 255
    t.text     "introduction", limit: 65535
    t.text     "img_paths",    limit: 65535
    t.text     "catalog",      limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "status",       limit: 4
  end

  create_table "books", force: :cascade do |t|
    t.integer  "book_type_id", limit: 4
    t.string   "serial_code",  limit: 255
    t.integer  "status",       limit: 4
    t.integer  "borrow_times", limit: 4
    t.datetime "create_time"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "borrow_records", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "book_id",     limit: 4
    t.datetime "borrow_time"
    t.integer  "status",      limit: 4
    t.string   "book_name",   limit: 255
    t.string   "serial_code", limit: 255
    t.string   "user_name",   limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.datetime "time_limit"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "title",       limit: 255
    t.text     "content",     limit: 65535
    t.datetime "create_time"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "msg_type",    limit: 4
    t.integer  "sender_id",   limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name",       limit: 255
    t.string   "mail",            limit: 255
    t.integer  "permission",      limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255
  end

end
