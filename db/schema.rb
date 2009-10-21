# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090923003235) do

  create_table "forms", :force => true do |t|
    t.text     "comments"
    t.string   "email"
    t.integer  "days"
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", :force => true do |t|
    t.string   "opt_out"
    t.string   "un_solicited"
    t.string   "sell"
    t.string   "vulgar"
    t.string   "give_out"
    t.string   "email"
    t.text     "comments"
    t.integer  "website_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", :force => true do |t|
    t.text     "from_email"
    t.text     "ticket_collaterals"
    t.text     "to_email"
    t.text     "body"
    t.string   "subject"
    t.string   "status"
    t.integer  "whymail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "forms_id"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                                :null => false
    t.string   "website"
    t.string   "email",                                :null => false
    t.string   "crypted_password",                     :null => false
    t.string   "password_salt",                        :null => false
    t.string   "persistence_token",                    :null => false
    t.string   "perishable_token",                     :null => false
    t.integer  "login_count",       :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.boolean  "admin",             :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

  create_table "websites", :force => true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "grade"
    t.integer  "rank"
    t.integer  "opt_out_count"
    t.integer  "un_solicited_count"
    t.integer  "sell_count"
    t.integer  "vulgar_count"
    t.integer  "give_out_count"
  end

  create_table "whymail", :force => true do |t|
    t.string   "website"
    t.string   "email"
    t.string   "main_url"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
