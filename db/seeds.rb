# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
meals = ['Breakfast', 'Lunch', 'Dinner']

days.each do |day|
  Day.create(name: day)
end

meals.each do |meal|
  Meal.create(name: meal)
end

def add_ingredients_to_recipe(ingredients, recipe)
  ingredients.each do |ing|
    ingredient = Ingredient.find_or_create_by(name: ing[:name])
    RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: ingredient.id, unit: ing[:unit], amount: ing[:amount])
  end
end

#Chipotle Popcorn Chicken
nugget_ingredients = [
  {name: "Chicken Breast", unit: nil, amount: 2},
  {name: "Buttermilk", unit: 'cup(s)', amount: 2},
  {name: "Chiles in Adobo Sauce", unit: 'oz', amount: 1},
  {name: "Panko Bread Crumbs", unit: 'cups', amount: 2},
  {name: "Chili Powder", unit: 'tsp', amount: 1},
  {name: "Paprika", unit: 'tsp', amount: 1}
]

nuggets = Recipe.create(name: "Chiptle Popcorn Chicken", instructions: "https://tasty.co/recipe/chipotle-popcorn-chicken", bulk: false, meal_id: 1)
add_ingredients_to_recipe(nugget_ingredients, nuggets)



#Slow Cooker Chicken and Biscuits
cnb_ingredients = [
  {name: "Chicken Breast", unit: nil, amount: 3},
  {name: "Broccoli", unit: 'cup(s)', amount: 2},
  {name: "Baby Carrots", unit: 'cup(s)', amount: 2},
  {name: "Cream of Chicken Soup", unit: 'can(s)', amount: 1},
  {name: "Canned Biscuits", unit: 'can(s)', amount: 1}
]

cnb = Recipe.create(name: "Slow Cooker Chicken and Biscuits", instructions: "https://tasty.co/recipe/slow-cooker-chicken-biscuits", bulk: true, meal_id: 2)
add_ingredients_to_recipe(cnb_ingredients, cnb)


#Garlic Shrimp Scampi
scampi_ingredients = [
  {name: "Garlic", unit: 'cloves', amount: 3},
  {name: "Shrimp", unit: nil, amount: 1},
  {name: "Lemon", unit: nil, amount: 1},
  {name: "Spaghetti", unit: 'cup(s)', amount: 1}
]

scampi = Recipe.create(name: "Garlic Shrimp Scampi", instructions: "https://tasty.co/recipe/garlic-shrimp-scampi", bulk: false, meal_id: 2)
add_ingredients_to_recipe(scampi_ingredients, scampi)



#[{name: , value: }, ],
