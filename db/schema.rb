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

ActiveRecord::Schema.define(version: 20141104024245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "roles", force: true do |t|
    t.string "name"
  end

  create_table "translations", force: true do |t|
    t.integer "translatable_id"
    t.string  "translatable_type"
    t.string  "locale"
    t.string  "field_name"
    t.text    "field_translation"
  end

  add_index "translations", ["translatable_id"], name: "index_translations_on_translatable_id", using: :btree

  create_table "user_roles", force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "user_roles", ["user_id", "role_id"], name: "index_user_roles_on_user_id_and_role_id", using: :btree

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
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "language_id"
    t.integer  "country_id"
    t.string   "phone"
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["country_id"], name: "index_users_on_country_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["language_id"], name: "index_users_on_language_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
