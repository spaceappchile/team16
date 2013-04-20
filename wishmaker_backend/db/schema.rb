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

ActiveRecord::Schema.define(:version => 20130420203140) do

  create_table "meteors", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "description"
    t.datetime "starting"
    t.datetime "ending"
    t.string   "address"
    t.string   "photo"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.spatial  "the_geom",    :limit => {:srid=>-1, :type=>"point"}
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "birthday"
    t.integer  "sex"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "wishes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "meteor_id"
    t.text     "description"
    t.boolean  "made"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "wishes", ["meteor_id"], :name => "index_wishes_on_meteor_id"
  add_index "wishes", ["user_id"], :name => "index_wishes_on_user_id"

end
