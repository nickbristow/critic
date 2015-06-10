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

ActiveRecord::Schema.define(version: 20150608235314) do

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

  add_index "consoles_games", ["console_id"], name: "index_consoles_games_on_console_id"
  add_index "consoles_games", ["game_id"], name: "index_consoles_games_on_game_id"

  create_table "editors", force: :cascade do |t|
    t.string   "name"
    t.string   "outlet"
    t.string   "bio"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "releasedate"
    t.string   "boxart"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.float    "score"
    t.string   "link"
    t.integer  "editor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "game_id"
  end

end
