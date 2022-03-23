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

ActiveRecord::Schema.define(version: 2021_11_23_114440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dim_customers", force: :cascade do |t|
    t.date "creation_date"
    t.string "company_name"
    t.string "main_contact_full_name"
    t.string "main_contact_email"
    t.integer "number_of_elevators"
    t.string "customer_city"
  end

  create_table "fact_contacts", force: :cascade do |t|
    t.datetime "creation_date"
    t.string "company_name"
    t.string "email"
    t.string "project_name"
  end

  create_table "fact_elevators", force: :cascade do |t|
    t.string "serial_number"
    t.date "date_of_commissionning"
    t.string "building_id"
    t.string "customer_id"
    t.string "building_city"
  end

  create_table "fact_interventions", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.integer "building_id", null: false
    t.integer "battery_id"
    t.integer "column_id"
    t.integer "elevator_id"
    t.datetime "intervention_start_time", null: false
    t.datetime "intervention_end_time"
    t.string "result", null: false
    t.string "report"
    t.string "status", null: false
  end

  create_table "fact_quotes", force: :cascade do |t|
    t.datetime "creation_date"
    t.string "company_name"
    t.string "email"
    t.integer "number_of_elevators"
  end

end
