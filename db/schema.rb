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

ActiveRecord::Schema.define(version: 2019_05_26_194549) do

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "episodes", force: :cascade do |t|
    t.string "title"
    t.integer "show_id"
    t.text "description"
    t.string "episode_number"
    t.date "published_at"
    t.string "guid"
    t.string "slug"
    t.integer "earwolf_id"
    t.integer "stitcher_id"
    t.integer "stagebloc_id"
    t.integer "wolfpub_id"
    t.string "youtube_url"
    t.string "art19_url"
    t.text "streaming_url"
    t.text "download_url"
    t.boolean "premium"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_episodes_on_show_id"
  end

  create_table "guests", force: :cascade do |t|
    t.integer "episode_id"
    t.string "name"
    t.text "bio"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["episode_id"], name: "index_guests_on_episode_id"
  end

  create_table "hosts", force: :cascade do |t|
    t.integer "show_id"
    t.string "name"
    t.text "bio"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_hosts_on_show_id"
  end

  create_table "networks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shows", force: :cascade do |t|
    t.integer "network_id"
    t.string "title"
    t.text "description"
    t.date "published_at"
    t.string "logo_url"
    t.boolean "premium"
    t.integer "tier_required"
    t.string "trailer_url"
    t.string "slug"
    t.string "type_from_feed"
    t.string "sort_direction"
    t.date "latest_episode_published_at"
    t.boolean "seasoned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["network_id"], name: "index_shows_on_network_id"
  end

end
