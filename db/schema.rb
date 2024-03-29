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

ActiveRecord::Schema.define(:version => 20120522065002) do

  create_table "addresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "prefecture"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "deleted_at"
  end

  add_index "addresses", ["deleted_at"], :name => "index_addresses_on_deleted_at"
  add_index "addresses", ["user_id", "prefecture"], :name => "index_addresses_on_user_id_and_prefecture"

  create_table "admins", :force => true do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "imag_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "books", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "author",     :null => false
    t.string   "isbn",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "deleted_at"
    t.string   "pdf_uid"
    t.string   "pdf_name"
  end

  add_index "books", ["deleted_at"], :name => "index_books_on_deleted_at"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "lends", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "book_id",    :null => false
    t.datetime "return_day"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "deleted_at"
  end

  add_index "lends", ["deleted_at"], :name => "index_lends_on_deleted_at"
  add_index "lends", ["user_id", "book_id", "return_day", "deleted_at"], :name => "index_lends_on_user_id_and_book_id_and_return_day_and_deleted_at", :unique => true

  create_table "twi_users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "twis", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",             :null => false
    t.string   "kana",             :null => false
    t.date     "birthday",         :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.datetime "deleted_at"
    t.string   "cover_image_uid"
    t.string   "cover_image_name"
  end

  add_index "users", ["deleted_at"], :name => "index_users_on_deleted_at"

end
