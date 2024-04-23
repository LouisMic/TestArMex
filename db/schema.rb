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

ActiveRecord::Schema[7.1].define(version: 2024_04_23_163546) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "performance_id", null: false
    t.datetime "booking_date"
    t.string "channel"
    t.string "booking_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["performance_id"], name: "index_bookings_on_performance_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "performances", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "show_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_performances_on_show_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.float "price"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_tickets_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "adress"
    t.string "postal_code"
    t.string "country"
    t.integer "age"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "performances"
  add_foreign_key "bookings", "users"
  add_foreign_key "performances", "shows"
  add_foreign_key "tickets", "bookings"
end
