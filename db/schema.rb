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

ActiveRecord::Schema.define(version: 20160621013304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       limit: 255
    t.index ["slug"], name: "index_categories_on_slug", unique: true, using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image",          limit: 255
    t.integer  "subcategory_id"
    t.string   "description",    limit: 255
  end

  create_table "photos_tags", id: false, force: :cascade do |t|
    t.integer "photo_id"
    t.integer "tag_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "answer",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "slug",        limit: 255
    t.index ["slug"], name: "index_subcategories_on_slug", unique: true, using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
