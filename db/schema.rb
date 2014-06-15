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

ActiveRecord::Schema.define(version: 20140615182045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: true do |t|
    t.string   "date"
    t.string   "hour"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chat_users", force: true do |t|
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time_zone"
  end

  create_table "chats", force: true do |t|
    t.string   "owner"
    t.string   "channel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "encrypted_name"
    t.string   "encrypted_name_salt"
    t.string   "encrypted_name_iv"
    t.string   "encrypted_zipcode"
    t.string   "encrypted_zipcode_salt"
    t.string   "encrypted_zipcode_iv"
    t.text     "encrypted_description"
    t.text     "encrypted_description_salt"
    t.text     "encrypted_description_iv"
    t.string   "encrypted_gender"
    t.string   "encrypted_gender_salt"
    t.string   "encrypted_gender_iv"
    t.string   "encrypted_age"
    t.string   "encrypted_age_salt"
    t.string   "encrypted_age_iv"
    t.string   "encrypted_insurance"
    t.string   "encrypted_insurance_salt"
    t.string   "encrypted_insurance_iv"
    t.text     "responses",                                            array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "current_therapist"
    t.string   "current_therapist_name"
    t.string   "stripe_token"
    t.string   "phone"
    t.string   "time_zone"
    t.string   "email",                      default: "", null: false
    t.string   "encrypted_password",         default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "clients", ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree

  create_table "events", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "start"
    t.string   "end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "therapist_id"
    t.integer  "client_id"
    t.string   "start_time"
    t.string   "start_date"
    t.string   "time_zone"
  end

  create_table "messages", force: true do |t|
    t.text     "message"
    t.integer  "chat_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "therapists", force: true do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "state"
    t.string   "license_number"
    t.string   "degree"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "city"
    t.string   "zipcode"
    t.string   "phone"
    t.text     "bio"
    t.string   "permalink"
    t.text     "retina_dimensions"
    t.text     "issues"
    t.string   "title"
    t.text     "approach"
    t.text     "welcome"
    t.text     "approach_sub1"
    t.text     "approach_sub2"
    t.string   "approach_sub1_title"
    t.string   "approach_sub2_title"
    t.string   "school_name"
    t.string   "time_zone"
    t.string   "open_slots",             default: [],              array: true
  end

  add_index "therapists", ["email"], name: "index_therapists_on_email", unique: true, using: :btree
  add_index "therapists", ["reset_password_token"], name: "index_therapists_on_reset_password_token", unique: true, using: :btree

end
