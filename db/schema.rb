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

ActiveRecord::Schema.define(version: 20160328192338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "students", force: :cascade do |t|
    t.float    "age"
    t.integer  "registerNumber"
    t.string   "pupilForname"
    t.string   "pupilSurname"
    t.string   "pupilAddress"
    t.string   "parentSurname"
    t.string   "parentsOccupation"
    t.string   "pupilReligion"
    t.integer  "monthlyAttendanceTotal"
    t.integer  "yearlyAttendanceTotal"
    t.string   "additionalNotes"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "pupilClass"
    t.datetime "dateOfEntry"
    t.string   "parentForname"
  end

end
