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

ActiveRecord::Schema.define(:version => 20110610001303) do

  create_table "mods", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modules", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monsters", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "level"
    t.integer  "health"
    t.integer  "defence"
    t.integer  "damage"
    t.integer  "monster_number"
    t.integer  "treasure_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monstertomes", :force => true do |t|
    t.string   "name"
    t.integer  "room_id"
    t.integer  "monster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.integer  "room_number"
    t.integer  "north_exit"
    t.integer  "south_exit"
    t.integer  "east_exit"
    t.integer  "west_exit"
    t.integer  "mod_id"
    t.integer  "monster1"
    t.integer  "monster2"
    t.integer  "monster3"
    t.integer  "monster4"
    t.integer  "monster5"
  end

end
