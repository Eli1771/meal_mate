# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
nugget_ingredients = [
  [{name: "Chicken Breast", value: 3.15}, 2],
  [{name: "Buttermilk", value: 2.0}, 2],
  [{name: "Chiles in Adobo Sauce", value: 4.60}, 1],
  [{name: "Panko Bread Crumbs", value: 0.88}, 2],
  [{name: "Chili Powder", value: 0.14}, 1],
  [{name: "Paprika", value: 0.09}, 1],
]

nuggets = Recipe.create(name: "Chiptle Popcorn Chicken", instructions: "https://tasty.co/recipe/chipotle-popcorn-chicken", bulk: false)

nugget_ingredients.each do |ing|
  ingredient = Ingredient.create(ing[0])
  RecipeIngredient.create(recipe_id: nuggets.id, ingredient_id: ingredient.id, amount: ing[1])
end
