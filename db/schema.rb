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

ActiveRecord::Schema.define(version: 2019_11_18_211249) do

  create_table "day_plans", force: :cascade do |t|
    t.integer "day_id"
    t.integer "week_plan_id"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["day_id"], name: "index_day_plans_on_day_id"
    t.index ["slug"], name: "index_day_plans_on_slug", unique: true
    t.index ["week_plan_id"], name: "index_day_plans_on_week_plan_id"
  end

  create_table "days", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
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

  create_table "recipe_plans", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "day_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_plan_id"], name: "index_recipe_plans_on_day_plan_id"
    t.index ["recipe_id"], name: "index_recipe_plans_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "meal_id"
    t.string "name"
    t.string "instructions"
    t.boolean "bulk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_recipes_on_meal_id"
  end

  create_table "week_plans", force: :cascade do |t|
    t.string "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
