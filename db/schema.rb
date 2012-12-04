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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121204040354) do

  create_table "setlists", :force => true do |t|
    t.string   "name"
    t.integer  "duration"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "setlists_songs", :id => false, :force => true do |t|
    t.integer "song_id"
    t.integer "setlist_id"
  end

  add_index "setlists_songs", ["setlist_id", "song_id"], :name => "index_setlists_songs_on_setlist_id_and_song_id"
  add_index "setlists_songs", ["song_id", "setlist_id"], :name => "index_setlists_songs_on_song_id_and_setlist_id"

  create_table "songs", :force => true do |t|
    t.integer  "duration"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "tuning"
    t.string   "key"
    t.integer  "bpm"
  end

end
