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

ActiveRecord::Schema.define(:version => 20120811210818) do

  create_table "bpsections", :force => true do |t|
    t.string   "title"
    t.integer  "startup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bpsubsections", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "bpsection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "descriptions", :force => true do |t|
    t.string   "title"
    t.string   "desc_type"
    t.text     "desc"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "upload_content_file_name"
    t.string   "upload_content_content_type"
    t.integer  "upload_content_file_size"
    t.datetime "upload_content_updated_at"
    t.integer  "startup_id"
    t.string   "video_code"
  end

  create_table "emails", :force => true do |t|
    t.string   "to"
    t.string   "from"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faqs", :force => true do |t|
    t.string   "question"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.string   "page_type"
    t.string   "page_title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "startups", :force => true do |t|
    t.integer  "user_id"
    t.string   "startup_name"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "brief_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "startup_logo_file_name"
    t.string   "startup_logo_content_type"
    t.integer  "startup_logo_file_size"
    t.datetime "startup_logo_updated_at"
    t.string   "username"
    t.boolean  "active",                    :default => false
    t.integer  "donation_amount",           :default => 0
    t.text     "busplandesc"
  end

  create_table "transactions", :force => true do |t|
    t.string   "amount"
    t.string   "transaction_type"
    t.integer  "user_id"
    t.integer  "startup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "charge_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "admin"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "active",                 :default => true
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "stripe_customer_token"
    t.string   "last_four_cc"
  end

end
