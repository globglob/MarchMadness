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

ActiveRecord::Schema.define(:version => 20110311160316) do

  create_table "games", :force => true do |t|
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.integer  "team1_score"
    t.integer  "team2_score"
    t.integer  "round"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["team1_id"], :name => "index_games_on_team1_id"
  add_index "games", ["team2_id"], :name => "index_games_on_team2_id"

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

  create_table "squads", :force => true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.integer  "pick_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "squads", ["team_id"], :name => "index_squads_on_team_id"
  add_index "squads", ["user_id"], :name => "index_squads_on_user_id"

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.boolean  "visible",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name",       :limit => 50
    t.string   "nickname",   :limit => 50
    t.integer  "seed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name", :limit => 25
    t.string   "last_name",  :limit => 50
    t.string   "email",                    :default => "", :null => false
    t.string   "password",   :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
