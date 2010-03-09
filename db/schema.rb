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

ActiveRecord::Schema.define(:version => 20100307201122) do

  create_table "dictionaries", :force => true do |t|
    t.string   "word"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.integer  "length"
  end

  create_table "forms", :force => true do |t|
    t.text     "comments"
    t.string   "email"
    t.integer  "days"
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
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
    t.string   "body_hash"
    t.text     "email"
  end

  add_index "tickets", ["to_email", "body_hash", "from_email"], :name => "index_tickets_on_to_email_and_body_hash_and_from_email", :unique => true, :limit => {"body_hash"=>nil, "to_email"=>"255", "from_email"=>"255"}

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
    t.string   "level"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :limit => {"email"=>nil}
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at", :limit => {"last_request_at"=>nil}
  add_index "users", ["login"], :name => "index_users_on_login", :limit => {"login"=>nil}
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token", :limit => {"perishable_token"=>nil}
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :limit => {"persistence_token"=>nil}

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
