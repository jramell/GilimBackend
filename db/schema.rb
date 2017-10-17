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

ActiveRecord::Schema.define(version: 20170518153820) do

  create_table "achievements", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "name"
    t.string   "points"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "achievements", ["event_id"], name: "index_achievements_on_event_id"

  create_table "artist_profiles", force: :cascade do |t|
    t.string   "artist_email"
    t.string   "biography"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "artist_profiles", ["artist_email"], name: "index_artist_profiles_on_artist_email", unique: true

  create_table "artists", id: false, force: :cascade do |t|
    t.string   "email",             null: false
    t.string   "password"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "name"
    t.string   "genres"
    t.integer  "followerCount"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "instagram_url"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "follower_count"
    t.integer  "recommended_count"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "instagram_link"
  end

  add_index "artists", ["email"], name: "index_artists_on_email", unique: true

  create_table "events", force: :cascade do |t|
    t.string   "artist_email"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "name"
    t.string   "placeName"
    t.string   "description"
    t.string   "assistants"
    t.string   "assist_requests"
    t.string   "date"
    t.integer  "followerCount"
    t.string   "converted_image"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "events", ["artist_email"], name: "index_events_on_artist_email"

  create_table "fans", id: false, force: :cascade do |t|
    t.string   "email",             null: false
    t.string   "password"
    t.string   "name"
    t.string   "longitude"
    t.string   "latitude"
    t.string   "likedGenres"
    t.string   "followedArtists"
    t.string   "followedEvents"
    t.integer  "discoveryDistance"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "achievements"
  end

  add_index "fans", ["email"], name: "index_fans_on_email", unique: true

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "presentation_cards", force: :cascade do |t|
    t.string   "artist_email"
    t.integer  "song_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "presentation_cards", ["artist_email"], name: "index_presentation_cards_on_artist_email", unique: true
  add_index "presentation_cards", ["song_id"], name: "index_presentation_cards_on_song_id"

  create_table "songs", force: :cascade do |t|
    t.string   "artist_email"
    t.string   "song_url"
    t.string   "soundcloud_url"
    t.string   "name"
    t.string   "duration"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "songs", ["artist_email"], name: "index_songs_on_artist_email"

end
