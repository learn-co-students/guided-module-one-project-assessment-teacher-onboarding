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

ActiveRecord::Schema.define(version: 6) do

  create_table "host_labels", force: :cascade do |t|
    t.integer "host_id"
    t.integer "label_id"
    t.datetime "host_label_date"
    t.index ["host_id"], name: "index_host_labels_on_host_id"
    t.index ["label_id"], name: "index_host_labels_on_label_id"
  end

  create_table "hosts", force: :cascade do |t|
    t.string "name"
  end

  create_table "label_users", force: :cascade do |t|
    t.integer "label_id"
    t.integer "user_id"
    t.datetime "label_user_date"
    t.index ["label_id"], name: "index_label_users_on_label_id"
    t.index ["user_id"], name: "index_label_users_on_user_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "host_id"
    t.index ["host_id"], name: "index_locations_on_host_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
