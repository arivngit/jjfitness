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

ActiveRecord::Schema.define(:version => 20111227185033) do

  create_table "fees", :force => true do |t|
    t.integer  "member_id"
    t.date     "from",                            :null => false
    t.date     "to",                              :null => false
    t.integer  "amount"
    t.integer  "advance",    :default => 0
    t.integer  "pending"
    t.string   "proprietor", :default => "jagan"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.integer  "memership_number"
    t.string   "name",             :default => "", :null => false
    t.integer  "age"
    t.string   "blood_group"
    t.string   "profession"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "last_paid"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "hashed_password"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt",            :limit => 40
  end

  add_index "users", ["username"], :name => "index_users_on_username"

end
