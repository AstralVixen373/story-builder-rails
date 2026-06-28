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

ActiveRecord::Schema[8.1].define(version: 2026_06_28_161359) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "chapters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "position", default: 0, null: false
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "character_locations", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.datetime "created_at", null: false
    t.bigint "location_id", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_locations_on_character_id"
    t.index ["location_id"], name: "index_character_locations_on_location_id"
  end

  create_table "character_relationships", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.datetime "created_at", null: false
    t.bigint "linked_character_id", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_relationships_on_character_id"
    t.index ["linked_character_id"], name: "index_character_relationships_on_linked_character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "scenes", force: :cascade do |t|
    t.bigint "chapter_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.integer "position", default: 0, null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_scenes_on_chapter_id"
  end

  add_foreign_key "character_locations", "characters"
  add_foreign_key "character_locations", "locations"
  add_foreign_key "character_relationships", "characters"
  add_foreign_key "character_relationships", "characters", column: "linked_character_id"
  add_foreign_key "scenes", "chapters"
end
