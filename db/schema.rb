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

ActiveRecord::Schema.define(version: 20170923031338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guests", force: :cascade do |t|
    t.bigint "invitation_id"
    t.string "name"
    t.string "category", null: false
    t.datetime "accepted_at"
    t.datetime "declined_at"
    t.string "entree_selection"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invitation_id"], name: "index_guests_on_invitation_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.string "rsvp_code", null: false
    t.string "addressee", null: false
    t.string "address_line_1", null: false
    t.string "address_line_2"
    t.string "city", null: false
    t.string "state"
    t.string "country"
    t.string "zip", null: false
    t.datetime "sent_at"
    t.datetime "rsvped_at"
    t.string "rsvp_comment", limit: 1024
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
