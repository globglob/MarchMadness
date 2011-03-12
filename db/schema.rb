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

ActiveRecord::Schema.define(:version => 20110312181038) do

  create_table "draft_picks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "draft_order"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "draft_picks", ["user_id"], :name => "index_draft_picks_on_user_id"

  create_table "games", :force => true do |t|
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.integer  "winner_score"
    t.integer  "loser_score"
    t.integer  "round"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["winner_id", "loser_id"], :name => "index_games_on_winner_id_and_loser_id"

  create_table "pages", :force => true do |t|
    t.integer  "subject_id"
    t.string   "name"
    t.string   "permalink"
    t.integer  "position"
    t.boolean  "visible",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["permalink"], :name => "index_pages_on_permalink"
  add_index "pages", ["subject_id"], :name => "index_pages_on_subject_id"

  create_table "sections", :force => true do |t|
    t.integer  "page_id"
    t.string   "name"
    t.integer  "position"
    t.boolean  "visible",      :default => false
    t.string   "content_type"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["page_id"], :name => "index_sections_on_page_id"

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.boolean  "visible",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.integer  "draft_pick_id"
    t.string   "name",          :limit => 50
    t.string   "nickname",      :limit => 50
    t.integer  "seed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["draft_pick_id"], :name => "index_teams_on_draft_pick_id"

  create_table "users", :force => true do |t|
    t.string   "first_name", :limit => 25
    t.string   "last_name",  :limit => 50
    t.string   "email",                    :default => "", :null => false
    t.string   "password",   :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
