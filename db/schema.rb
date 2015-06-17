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

ActiveRecord::Schema.define(version: 20150617142959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consoles", force: :cascade do |t|
    t.string   "name"
    t.string   "abbr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consoles_games", id: false, force: :cascade do |t|
    t.integer "game_id"
    t.integer "console_id"
  end

  add_index "consoles_games", ["console_id"], name: "index_consoles_games_on_console_id", using: :btree
  add_index "consoles_games", ["game_id"], name: "index_consoles_games_on_game_id", using: :btree

  create_table "editors", force: :cascade do |t|
    t.string   "name"
    t.string   "outlet"
    t.string   "bio"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "games", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "releasedate"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "boxart_file_name"
    t.string   "boxart_content_type"
    t.integer  "boxart_file_size"
    t.datetime "boxart_updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.float    "score"
    t.string   "link"
    t.integer  "editor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "game_id"
  end

  create_table "userreviews", force: :cascade do |t|
    t.integer  "score"
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
