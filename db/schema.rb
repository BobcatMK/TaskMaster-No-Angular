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

ActiveRecord::Schema.define(version: 20141222164824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calendars", force: true do |t|
    t.integer  "year"
    t.integer  "month"
    t.integer  "day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calendars_tasks", id: false, force: true do |t|
    t.integer "task_id",     null: false
    t.integer "calendar_id", null: false
  end

  add_index "calendars_tasks", ["calendar_id", "task_id"], name: "index_calendars_tasks_on_calendar_id_and_task_id", using: :btree
  add_index "calendars_tasks", ["task_id", "calendar_id"], name: "index_calendars_tasks_on_task_id_and_calendar_id", using: :btree

  create_table "contacts", force: true do |t|
    t.string   "fullname"
    t.string   "email"
    t.string   "phone"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "github"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.text     "description"
    t.boolean  "completed"
    t.integer  "todolist_id"
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start"
    t.datetime "end"
  end

  add_index "tasks", ["todolist_id"], name: "index_tasks_on_todolist_id", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "todolists", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "todolists", ["user_id"], name: "index_todolists_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
