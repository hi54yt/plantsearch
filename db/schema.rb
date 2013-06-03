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

ActiveRecord::Schema.define(:version => 20130603135407) do

  create_table "flsgsqs", :force => true do |t|
    t.integer  "plant_id"
    t.string   "month"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gsydjs", :force => true do |t|
    t.integer  "plant_id"
    t.string   "level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "plants", :force => true do |t|
    t.integer  "code"
    t.string   "zw"
    t.string   "ldm"
    t.string   "cdxzzb"
    t.string   "cl"
    t.string   "xzd"
    t.string   "zygsbw"
    t.string   "sd"
    t.string   "flsgsq"
    t.string   "zhstfwqlpx"
    t.string   "jwzs"
    t.string   "gtsy"
    t.string   "zc"
    t.string   "hjwr"
    t.string   "bctr"
    t.string   "yzxx"
    t.string   "gsydj"
    t.string   "trsfsyxdj"
    t.string   "phmin"
    t.string   "phmax"
    t.string   "apmin"
    t.string   "apmax"
    t.string   "akmin"
    t.string   "akmax"
    t.string   "tnmin"
    t.string   "tnmax"
    t.string   "socmin"
    t.string   "socmax"
    t.string   "sbdmin"
    t.string   "sbdmax"
    t.string   "sfjdx"
    t.string   "sfjhfzmx"
    t.string   "sfjc"
    t.string   "ke"
    t.string   "shu"
    t.string   "bjzwzym"
    t.string   "zysj"
    t.string   "gss"
    t.string   "yjlyqy"
    t.string   "kdzg"
    t.string   "zysq"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trsfsyxdjs", :force => true do |t|
    t.integer  "plant_id"
    t.string   "level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
