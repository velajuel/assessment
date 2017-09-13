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

ActiveRecord::Schema.define(version: 20170818073644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "provider"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_authentications_on_patient_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "patient_name"
    t.string "treatment_service"
    t.string "mobile_number"
    t.string "ic_number"
    t.date "booking_date"
    t.string "booking_time"
    t.bigint "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "identifier_token"
    t.index ["doctor_id"], name: "index_bookings_on_doctor_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "contact_information"
    t.string "company_name"
    t.string "location"
    t.string "registration_number"
    t.integer "min_rate"
    t.integer "max_rate"
    t.integer "opening_hours"
    t.integer "closing_hours"
    t.json "types_of_service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "authentications", "patients"
end
