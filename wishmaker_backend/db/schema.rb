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

ActiveRecord::Schema.define(:version => 20130420213949) do

  create_table "apn_apps", :force => true do |t|
    t.text     "apn_dev_cert"
    t.text     "apn_prod_cert"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "apn_device_groupings", :force => true do |t|
    t.integer "group_id"
    t.integer "device_id"
  end

  add_index "apn_device_groupings", ["device_id"], :name => "index_apn_device_groupings_on_device_id"
  add_index "apn_device_groupings", ["group_id", "device_id"], :name => "index_apn_device_groupings_on_group_id_and_device_id"
  add_index "apn_device_groupings", ["group_id"], :name => "index_apn_device_groupings_on_group_id"

  create_table "apn_devices", :force => true do |t|
    t.string   "token",                                                     :null => false
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.datetime "last_registered_at"
    t.integer  "app_id"
    t.integer  "mobile_user_id"
    t.spatial  "the_geom",           :limit => {:srid=>-1, :type=>"point"}
  end

  add_index "apn_devices", ["token"], :name => "index_apn_devices_on_token"

  create_table "apn_group_notifications", :force => true do |t|
    t.integer  "group_id",          :null => false
    t.string   "device_language"
    t.string   "sound"
    t.string   "alert"
    t.integer  "badge"
    t.text     "custom_properties"
    t.datetime "sent_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "apn_group_notifications", ["group_id"], :name => "index_apn_group_notifications_on_group_id"

  create_table "apn_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "app_id"
  end

  create_table "apn_notifications", :force => true do |t|
    t.integer  "device_id",                        :null => false
    t.integer  "errors_nb",         :default => 0
    t.string   "device_language"
    t.string   "sound"
    t.string   "alert"
    t.integer  "badge"
    t.datetime "sent_at"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.text     "custom_properties"
  end

  add_index "apn_notifications", ["device_id"], :name => "index_apn_notifications_on_device_id"

  create_table "apn_pull_notifications", :force => true do |t|
    t.integer  "app_id"
    t.string   "title"
    t.string   "content"
    t.string   "link"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.boolean  "launch_notification"
  end

  create_table "gcm_devices", :force => true do |t|
    t.string   "registration_id",                                           :null => false
    t.datetime "last_registered_at"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.integer  "mobile_user_id"
    t.spatial  "the_geom",           :limit => {:srid=>-1, :type=>"point"}
  end

  add_index "gcm_devices", ["registration_id"], :name => "index_gcm_devices_on_registration_id", :unique => true

  create_table "gcm_notifications", :force => true do |t|
    t.integer  "device_id",        :null => false
    t.string   "collapse_key"
    t.text     "data"
    t.boolean  "delay_while_idle"
    t.datetime "sent_at"
    t.integer  "time_to_live"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "gcm_notifications", ["device_id"], :name => "index_gcm_notifications_on_device_id"

  create_table "meteors", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "description"
    t.datetime "starting"
    t.datetime "ending"
    t.string   "address"
    t.string   "photo"
    t.datetime "created_at",                                                         :null => false
    t.datetime "updated_at",                                                         :null => false
    t.spatial  "the_geom",    :limit => {:srid=>4326, :type=>"point", :has_z=>true}
  end

  create_table "mobile_users", :force => true do |t|
    t.string   "username"
    t.string   "passwod"
    t.datetime "birthday"
    t.integer  "platform"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
    t.spatial  "the_geom",   :limit => {:srid=>4326, :type=>"point", :has_z=>true}
  end

  create_table "wishes", :force => true do |t|
    t.integer  "mobile_user_id"
    t.integer  "meteor_id"
    t.text     "description"
    t.boolean  "made"
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
    t.spatial  "the_geom",       :limit => {:srid=>4326, :type=>"point", :has_z=>true}
  end

  add_index "wishes", ["meteor_id"], :name => "index_wishes_on_meteor_id"
  add_index "wishes", ["mobile_user_id"], :name => "index_wishes_on_mobile_user_id"

end
