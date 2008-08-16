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

ActiveRecord::Schema.define(:version => 20080815114639) do

  create_table "articles", :force => true do |t|
    t.integer  "num"
    t.string   "title"
    t.text     "short_text"
    t.text     "body"
    t.string   "lang"
    t.string   "ident_name"
    t.integer  "ident_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charities", :force => true do |t|
    t.integer  "num"
    t.string   "title"
    t.text     "short_text"
    t.text     "body"
    t.string   "lang"
    t.string   "ident_name"
    t.integer  "ident_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.string   "lang"
    t.string   "ident_name"
    t.text     "body"
    t.integer  "country_id"
    t.integer  "num_order"
    t.integer  "ident_num"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "coord"
  end

  create_table "city_coords", :force => true do |t|
    t.integer  "city_id"
    t.integer  "city_ident_num"
    t.text     "coord"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "city_photos", :force => true do |t|
    t.integer  "city_id"
    t.integer  "city_ident_num"
    t.integer  "size"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "height"
    t.integer  "width"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "main"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "lang"
    t.string   "ident_name"
    t.text     "body"
    t.integer  "num_order"
    t.integer  "ident_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "num"
    t.string   "title"
    t.text     "short_text"
    t.text     "body"
    t.string   "lang"
    t.string   "ident_name"
    t.integer  "ident_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jim_articles", :force => true do |t|
    t.integer  "num"
    t.string   "title"
    t.text     "short_text"
    t.text     "body"
    t.string   "lang"
    t.string   "ident_name"
    t.integer  "ident_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maps", :force => true do |t|
    t.integer  "country_id"
    t.integer  "country_ident_num"
    t.integer  "size"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "height"
    t.integer  "width"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member_photos", :force => true do |t|
    t.integer  "member_id"
    t.integer  "member_ident_num"
    t.integer  "size"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "height"
    t.integer  "width"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member_statuses", :force => true do |t|
    t.integer  "member_id"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "status"
    t.integer  "city_id"
    t.string   "lang"
    t.integer  "ident_num"
    t.string   "ident_name"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opinion_photos", :force => true do |t|
    t.integer  "opinion_id"
    t.integer  "size"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "height"
    t.integer  "width"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opinions", :force => true do |t|
    t.string   "author"
    t.string   "status"
    t.string   "lang"
    t.text     "body"
    t.integer  "city_id"
    t.integer  "ident_num"
    t.string   "ident_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "ident_name"
    t.string   "name"
    t.string   "lang"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.string   "status"
    t.integer  "number"
    t.string   "lang"
    t.string   "ident_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ident_num"
  end

  create_table "stories", :force => true do |t|
    t.integer  "member_id"
    t.string   "lang"
    t.string   "ident_name"
    t.integer  "ident_num"
    t.string   "title"
    t.text     "short_text"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "story_photos", :force => true do |t|
    t.integer  "story_id"
    t.integer  "story_ident_num"
    t.integer  "size"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "height"
    t.integer  "width"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "success_stories", :force => true do |t|
    t.string   "title"
    t.text     "short_text"
    t.text     "body"
    t.integer  "member_id"
    t.string   "lang"
    t.string   "ident_name"
    t.integer  "ident_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "success_story_photos", :force => true do |t|
    t.integer  "success_story_id"
    t.integer  "success_story_ident_num"
    t.integer  "size"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "height"
    t.integer  "width"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
