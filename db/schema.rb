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

ActiveRecord::Schema.define(version: 20150224151904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "issue_attachments", force: :cascade do |t|
    t.integer  "issue_id"
    t.integer  "attachment_id"
    t.string   "path"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "issue_attachments", ["issue_id"], name: "index_issue_attachments_on_issue_id", using: :btree

  create_table "issue_histories", force: :cascade do |t|
    t.integer  "issue_id"
    t.integer  "history_id"
    t.datetime "created_on"
    t.string   "action"
    t.string   "description"
    t.string   "creator"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "issue_histories", ["issue_id"], name: "index_issue_histories_on_issue_id", using: :btree

  create_table "issue_history_attachments", force: :cascade do |t|
    t.integer  "issue_history_id"
    t.integer  "attachment_id"
    t.string   "path"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "issue_history_attachments", ["issue_history_id"], name: "index_issue_history_attachments_on_issue_history_id", using: :btree

  create_table "issues", force: :cascade do |t|
    t.string   "title"
    t.integer  "order_number"
    t.integer  "project_id"
    t.datetime "created_on"
    t.datetime "last_updated_on"
    t.string   "last_updater"
    t.string   "tester"
    t.string   "fixer"
    t.string   "creator"
    t.string   "priority"
    t.string   "status"
    t.date     "due_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "description"
  end

  add_index "issues", ["project_id"], name: "index_issues_on_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
  end

  add_foreign_key "issue_attachments", "issues"
  add_foreign_key "issue_histories", "issues"
  add_foreign_key "issue_history_attachments", "issue_histories"
  add_foreign_key "issues", "projects"
end
