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

ActiveRecord::Schema.define(version: 20150305230400) do

  create_table "coupon_redemptions", force: :cascade do |t|
    t.integer  "coupon_id",  null: false
    t.string   "user_id"
    t.string   "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "code",                                    null: false
    t.string   "description"
    t.date     "valid_from",                              null: false
    t.date     "valid_until"
    t.integer  "redemption_limit",         default: 1,    null: false
    t.integer  "coupon_redemptions_count", default: 0,    null: false
    t.integer  "amount",                   default: 0,    null: false
    t.string   "type",                                    null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.text     "attachments",              default: "{}", null: false
  end

end
