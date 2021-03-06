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

ActiveRecord::Schema.define(version: 20140804040659) do

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "company_id"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  add_index "admin_users", ["username"], name: "index_admin_users_on_username", unique: true

  create_table "admin_users_roles", id: false, force: true do |t|
    t.integer "admin_user_id"
    t.integer "role_id"
  end

  add_index "admin_users_roles", ["admin_user_id", "role_id"], name: "index_admin_users_roles_on_admin_user_id_and_role_id"

  create_table "baidu_pushes", force: true do |t|
    t.string   "channel_id"
    t.integer  "pad_id",     limit: 255
    t.string   "push_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "company_name"
    t.string   "company_address"
    t.string   "company_tel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_plugins", force: true do |t|
    t.integer  "company_id"
    t.integer  "plugin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "informs", force: true do |t|
    t.integer  "company_id"
    t.string   "title"
    t.string   "author"
    t.text     "context"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "brief"
  end

  create_table "ips", force: true do |t|
    t.string   "user_name"
    t.string   "IP_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", force: true do |t|
    t.integer  "admin_user_id"
    t.integer  "company_id"
    t.string   "event"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: true do |t|
    t.integer  "company_id"
    t.string   "title"
    t.string   "author"
    t.text     "context"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pad_users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pad_id"
  end

  create_table "pads", force: true do |t|
    t.string   "Mac_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  add_index "pads", ["Mac_address"], name: "index_pads_on_Mac_address", unique: true

  create_table "plugins", force: true do |t|
    t.string   "name"
    t.string   "brief"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "company_id"
    t.string   "product_name"
    t.text     "context"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "brief"
  end

  create_table "push_messages", force: true do |t|
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "push_targets", force: true do |t|
    t.integer  "push_message_id"
    t.integer  "pad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

end
