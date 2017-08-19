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

ActiveRecord::Schema.define(version: 20170714141053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "surveys", force: :cascade do |t|
    t.string   "survey_ref"
    t.date     "date"
    t.string   "district"
    t.string   "road_name"
    t.string   "from"
    t.string   "to"
    t.decimal  "latitude",                  precision: 10, scale: 6
    t.decimal  "longitude",                 precision: 10, scale: 6
    t.string   "road_class"
    t.string   "road_type"
    t.integer  "no_of_lanes"
    t.decimal  "lane_width",                precision: 10, scale: 3
    t.string   "shoulder_type"
    t.decimal  "shoulder_width",            precision: 10, scale: 3
    t.string   "pavement_condition"
    t.string   "built_environment"
    t.decimal  "up_distance_to_junction",   precision: 10, scale: 3
    t.string   "up_junction_type"
    t.boolean  "up_signalized",                                      default: false
    t.decimal  "down_distance_to_junction", precision: 10, scale: 3
    t.string   "down_junction_type"
    t.boolean  "down_signalized",                                    default: false
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.index ["date"], name: "index_surveys_on_date", using: :btree
  end

  create_table "vehicle_stats", force: :cascade do |t|
    t.integer  "survey_id"
    t.string   "type"
    t.time     "from"
    t.time     "to"
    t.integer  "motor_cycle"
    t.integer  "three_wheeler"
    t.integer  "car"
    t.integer  "van_jeep"
    t.integer  "light_goods_vehicle"
    t.integer  "medium_goods_vehicle"
    t.integer  "heavy_goods_vehicle"
    t.string   "multi_axle_goods_vehicle"
    t.string   "mini_bus"
    t.string   "large_bus"
    t.string   "service_vehicle"
    t.string   "tractor"
    t.string   "bicycle"
    t.integer  "cart"
    t.integer  "total"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["from", "to"], name: "index_vehicle_stats_on_from_and_to", using: :btree
    t.index ["from"], name: "index_vehicle_stats_on_from", using: :btree
    t.index ["survey_id", "type"], name: "index_vehicle_stats_on_survey_id_and_type", using: :btree
    t.index ["survey_id"], name: "index_vehicle_stats_on_survey_id", using: :btree
    t.index ["to"], name: "index_vehicle_stats_on_to", using: :btree
    t.index ["total"], name: "index_vehicle_stats_on_total", using: :btree
    t.index ["type"], name: "index_vehicle_stats_on_type", using: :btree
  end

end
