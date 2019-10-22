# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def add_ingredients_to_recipe(ingredients, recipe)
  ingredients.each do |ing|
    ingredient = Ingredient.create_with(value: ing[0][:value]).find_or_create_by(name: ing[0][:name])
    RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: ingredient.id, amount: ing[1])
  end
end

#Chipotle Popcorn Chicken
nugget_ingredients = [
  [{name: "Chicken Breast", value: 3.15}, 2],
  [{name: "Buttermilk", value: 2.0}, 2],
  [{name: "Chiles in Adobo Sauce", value: 4.60}, 1],
  [{name: "Panko Bread Crumbs", value: 0.88}, 2],
  [{name: "Chili Powder", value: 0.14}, 1],
  [{name: "Paprika", value: 0.09}, 1],
]

nuggets = Recipe.create(name: "Chiptle Popcorn Chicken", instructions: "https://tasty.co/recipe/chipotle-popcorn-chicken", bulk: false)
add_ingredients_to_recipe(nugget_ingredients, nuggets)



#Slow Cooker Chicken and Biscuits
cnb_ingredients = [
  [{name: "Chicken Breast", value: 3.15}, 3],
  [{name: "Broccoli", value: 1.95}, 2],
  [{name: "Baby Carrots", value: 1.95}, 2],
  [{name: "Cream of Chicken Soup", value: 3}, 1],
  [{name: "Canned Biscuits", value: 1.30}, 1]
]

cnb = Recipe.create(name: "Slow Cooker Chicken and Biscuits", instructions: "https://tasty.co/recipe/slow-cooker-chicken-biscuits", bulk: true)
add_ingredients_to_recipe(cnb_ingredients, cnb)


#Garlic Shrimp Scampi
scampi_ingredients = [
  [{name: "Garlic", value: 0.8}, 3],
  [{name: "Shrimp", value: 6.50}, 1],
  [{name: "Lemon", value: 0.9}, 1],
  [{name: "Spaghetti", value: 1}, 1],
]

scampi = Recipe.create(name: "Garlic Shrimp Scampi", instructions: "https://tasty.co/recipe/garlic-shrimp-scampi", bulk: false)
add_ingredients_to_recipe(scampi_ingredients, scampi)



#[{name: , value: }, ],
