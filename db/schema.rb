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

ActiveRecord::Schema.define(version: 20160228080216) do

  create_table "blacklists", force: :cascade do |t|
    t.string   "number"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "blacklists", ["number"], name: "index_blacklists_on_number"

  create_table "blogs", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "blogs", ["slug"], name: "index_blogs_on_slug", unique: true

  create_table "calls", force: :cascade do |t|
    t.integer  "tracking_number_id"
    t.string   "accountsid"
    t.string   "to"
    t.string   "from"
    t.string   "callsid"
    t.string   "callduration"
    t.string   "direction"
    t.integer  "lmstatus"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "callercity"
    t.string   "callerstate"
    t.string   "callercountry"
    t.string   "callstatus"
    t.string   "calledcity"
  end

  add_index "calls", ["tracking_number_id"], name: "index_calls_on_tracking_number_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "charges", force: :cascade do |t|
    t.string   "stripe_id"
    t.integer  "amount"
    t.string   "card_last4"
    t.string   "card_type"
    t.string   "card_exp_month"
    t.string   "card_exp_year"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "charges", ["stripe_id"], name: "index_charges_on_stripe_id"
  add_index "charges", ["user_id"], name: "index_charges_on_user_id"

  create_table "citation_sources", force: :cascade do |t|
    t.string   "site"
    t.string   "submissionurl"
    t.integer  "da"
    t.boolean  "freesubmit"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "citations", force: :cascade do |t|
    t.integer  "citation_source_id"
    t.integer  "property_id"
    t.boolean  "napmatch"
    t.string   "url"
    t.integer  "pa"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "citations", ["citation_source_id"], name: "index_citations_on_citation_source_id"
  add_index "citations", ["property_id"], name: "index_citations_on_property_id"

  create_table "cities", force: :cascade do |t|
    t.integer  "province_id"
    t.string   "name"
    t.integer  "population"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.string   "govurl"
    t.string   "wikiurl"
    t.text     "descr"
    t.text     "mapurl"
  end

  add_index "cities", ["province_id"], name: "index_cities_on_province_id"
  add_index "cities", ["slug"], name: "index_cities_on_slug", unique: true

  create_table "companies", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "cname"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.integer  "province_id"
    t.string   "postalcode"
    t.string   "phone"
    t.string   "googleplus"
    t.string   "facebook"
    t.string   "linkedin"
    t.string   "twitter"
    t.string   "shortdescription"
    t.string   "longdescription"
    t.string   "tags"
    t.string   "citationemail"
    t.string   "businessemail"
    t.string   "login"
    t.string   "password"
    t.string   "timezone"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "companies", ["province_id"], name: "index_companies_on_province_id"
  add_index "companies", ["user_id"], name: "index_companies_on_user_id"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "machines", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.integer  "specialty_id"
    t.integer  "province_id"
    t.integer  "city_id"
    t.integer  "lmid",           limit: 8
    t.string   "slug"
    t.integer  "parent",         limit: 8
    t.integer  "retainer"
    t.integer  "retainercpl"
    t.integer  "leadguarantee"
    t.datetime "guaranteedate"
    t.integer  "cpl"
  end

  add_index "machines", ["category_id"], name: "index_machines_on_category_id"
  add_index "machines", ["city_id"], name: "index_machines_on_city_id"
  add_index "machines", ["province_id"], name: "index_machines_on_province_id"
  add_index "machines", ["specialty_id"], name: "index_machines_on_specialty_id"
  add_index "machines", ["subcategory_id"], name: "index_machines_on_subcategory_id"
  add_index "machines", ["user_id"], name: "index_machines_on_user_id"

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "province"
    t.string   "postalcode"
    t.string   "phone"
    t.string   "googleplus"
    t.string   "facebook"
    t.string   "linkedin"
    t.string   "twitter"
    t.string   "shortdescription"
    t.text     "longdescription"
    t.string   "tags"
    t.string   "url"
    t.string   "citationemail"
    t.string   "businessemail"
    t.string   "login"
    t.string   "password"
    t.string   "timezone"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "machine_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.string   "abr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "mapurl"
  end

  create_table "specialties", force: :cascade do |t|
    t.string   "name"
    t.integer  "leadvalue"
    t.integer  "subcategory_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "specialties", ["subcategory_id"], name: "index_specialties_on_subcategory_id"

  create_table "subcategories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id"

  create_table "tracking_numbers", force: :cascade do |t|
    t.string   "phone"
    t.integer  "status",      default: 0, null: false
    t.integer  "machine_id"
    t.integer  "provider",    default: 0, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "destination"
  end

  add_index "tracking_numbers", ["machine_id"], name: "index_tracking_numbers_on_machine_id"

  create_table "users", force: :cascade do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role",                   default: 1
    t.string   "stripe_id"
    t.string   "card_last4"
    t.integer  "card_exp_month"
    t.integer  "card_exp_year"
    t.string   "card_type"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
