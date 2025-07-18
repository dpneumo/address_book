# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_06_30_194147) do
  create_table "people", force: :cascade do |t|
    t.string "addressee"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "lastname"
    t.string "email"
    t.string "phone"
    t.string "pref_method"
    t.string "status", default: "uncontacted", null: false
    t.index ["pref_method"], name: "index_people_on_pref_method"
    t.index ["status"], name: "index_people_on_status"
  end
end
