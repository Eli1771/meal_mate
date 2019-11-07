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

ActiveRecord::Schema.define(version: 2019_11_07_033139) do

  create_table "day_plans", force: :cascade do |t|
    t.string "date"
    t.integer "breakfast"
    t.integer "lunch"
    t.integer "dinner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "ingredient_id"
    t.string "unit"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "instructions"
    t.integer "meal"
    t.boolean "bulk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "week_plans", force: :cascade do |t|
    t.integer "sunday"
    t.integer "monday"
    t.integer "tuesday"
    t.integer "wednesday"
    t.integer "thursday"
    t.boolean "current"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
