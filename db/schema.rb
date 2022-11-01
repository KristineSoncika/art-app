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

ActiveRecord::Schema.define(version: 2022_10_31_212012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artworks", force: :cascade do |t|
    t.string "artwork_id"
    t.string "title"
    t.string "has_not_been_viewed_much"
    t.string "date_start"
    t.string "date_end"
    t.string "artist_display"
    t.string "place_of_origin"
    t.string "dimensions"
    t.string "medium_display"
    t.string "fiscal_year"
    t.string "is_public_domain"
    t.string "colorfulness"
    t.string "latitude"
    t.string "longitude"
    t.string "gallery_title"
    t.string "is_on_view"
    t.string "artwork_type_title"
    t.string "department_title"
    t.string "artist_title"
    t.string "style_title"
    t.string "image_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_url"
  end

end
