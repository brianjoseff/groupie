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

ActiveRecord::Schema.define(:version => 20120222183305) do

  create_table "assignments", :force => true do |t|
    t.integer  "group_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["group_id"], :name => "index_assignments_on_group_id"
  add_index "assignments", ["post_id"], :name => "index_assignments_on_post_id"

  create_table "emails", :force => true do |t|
    t.string   "subject"
    t.text     "content"
    t.integer  "to",         :limit => 255
    t.integer  "from",       :limit => 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
  end

  create_table "group_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.boolean  "private"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "user_id"
    t.string   "group_password"
    t.string   "question"
    t.integer  "group_category_id"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "member_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["group_id"], :name => "index_memberships_on_group_id"
  add_index "memberships", ["member_id", "group_id"], :name => "index_memberships_on_member_id_and_group_id", :unique => true
  add_index "memberships", ["member_id"], :name => "index_memberships_on_member_id"

  create_table "post_images", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "imageable_id"
    t.string   "imageable_type"
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.boolean  "borrow"
    t.integer  "price"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "product_category_id"
    t.boolean  "premium_mult_group_viz"
  end

  create_table "product_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",    :limit => 128
    t.string   "salt",                  :limit => 128
    t.string   "confirmation_token",    :limit => 128
    t.string   "remember_token",        :limit => 128
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "zip"
    t.string   "school"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "admin",                                :default => false
    t.string   "last_4_digits"
    t.string   "stripe_id"
    t.boolean  "subscribed"
    t.string   "stripe_customer_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
