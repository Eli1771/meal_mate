class Recipe < ApplicationRecord
  belongs_to :meal
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_plans
  has_many :day_plans, through: :recipe_plans

  scope :meal, -> (id) { where[meal_id: id] }
end
