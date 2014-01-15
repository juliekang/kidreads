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

ActiveRecord::Schema.define(:version => 20140115042741) do

  create_table "books", :force => true do |t|
    t.string   "isbn"
    t.string   "title",         :null => false
    t.string   "author",        :null => false
    t.integer  "pub_year"
    t.string   "genre"
    t.integer  "num_pages"
    t.float    "reading_level"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "books", ["author"], :name => "index_books_on_author"
  add_index "books", ["genre"], :name => "index_books_on_genre"
  add_index "books", ["isbn"], :name => "index_books_on_isbn", :unique => true

  create_table "reviews", :force => true do |t|
    t.integer  "book_id",    :null => false
    t.integer  "user_id",    :null => false
    t.float    "rating",     :null => false
    t.text     "review"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reviews", ["book_id"], :name => "index_reviews_on_book_id"
  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"

  create_table "user_types", :force => true do |t|
    t.string   "label",       :null => false
    t.string   "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "user_types", ["label"], :name => "index_user_types_on_label", :unique => true

  create_table "users", :force => true do |t|
    t.integer  "user_type_id",    :null => false
    t.string   "username",        :null => false
    t.string   "email",           :null => false
    t.string   "first_name",      :null => false
    t.string   "last_name",       :null => false
    t.string   "city"
    t.string   "state"
    t.date     "birthday"
    t.string   "password_digest", :null => false
    t.string   "session_token"
    t.integer  "points"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["user_type_id"], :name => "index_users_on_user_type_id"
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end