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
  {name: 'Chicken Breast', unit: nil, amount: 2},
  {name: 'Buttermilk', unit: 'cup(s)', amount: 2},
  {name: 'Chiles in Adobo Sauce', unit: 'oz', amount: 1},
  {name: 'Panko Bread Crumbs', unit: 'cups', amount: 2},
  {name: 'Chili Powder', unit: 'tsp', amount: 1},
  {name: 'Paprika', unit: 'tsp', amount: 1},
  {name: 'Salt and Pepper', unit: 'tsp', amount: 0.5},
  {name: 'Oil', unit: nil, amount: nil}
]

nuggets = Recipe.create(name: 'Chiptle Popcorn Chicken', instructions: 'https://tasty.co/recipe/chipotle-popcorn-chicken', meal_id: 2)
add_ingredients_to_recipe(nugget_ingredients, nuggets)



#Slow Cooker Chicken and Biscuits
cnb_ingredients = [
  {name: 'Chicken Breast', unit: nil, amount: 3},
  {name: 'Broccoli', unit: 'cup(s)', amount: 2},
  {name: 'Baby Carrots', unit: 'cup(s)', amount: 2},
  {name: 'Cream of Chicken Soup', unit: 'can(s)', amount: 1},
  {name: 'Canned Biscuits', unit: 'can(s)', amount: 1},
  {name: 'Salt and Pepper', unit: 'To Taste', amount: nil}
]

cnb = Recipe.create(name: 'Slow Cooker Chicken and Biscuits', instructions: 'https://tasty.co/recipe/slow-cooker-chicken-biscuits', meal_id: 3)
add_ingredients_to_recipe(cnb_ingredients, cnb)


#Garlic Shrimp Scampi
scampi_ingredients = [
  {name: 'Garlic', unit: 'cloves', amount: 3},
  {name: 'Shrimp', unit: nil, amount: 1},
  {name: 'Lemon', unit: nil, amount: 1},
  {name: 'Spaghetti', unit: 'cup(s)', amount: 1},
  {name: 'Butter', unit: 'tbsp', amount: 3},
  {name: 'Salt and Pepper', unit: 'tsp', amount: 1},
  {name: 'Red Chili Flake', unit: 'tsp', amount: 1},
  {name: 'Parsley', unit: 'cup(s)', amount: 0.25}
]

scampi = Recipe.create(name: 'Garlic Shrimp Scampi', instructions: 'https://tasty.co/recipe/garlic-shrimp-scampi', meal_id: 3)
add_ingredients_to_recipe(scampi_ingredients, scampi)

#Bacon and Sausage Inside-out Breakfast Burrito
inside_out_bb_ingredients = [
  {name: 'Eggs', unit: nil, amount: 2},
  {name: 'Salt', unit: 'To Taste', amount: nil},
  {name: 'Shredded Parmesan', unit: 'tbsp', amount: 1},
  {name: 'Butter', unit: 'tbsp', amount: 0.5},
  {name: 'Shredded Cheddar', unit: 'cup(s)', amount: 0.25},
  {name: 'Breakfast Potato', unit: 'cup(s)', amount: 0.25},
  {name: 'Sausage', unit: 'cup(s)', amount: 0.25},
  {name: 'Bacon', unit: 'slice(s)', amount: 1.5}
]

inside_out_bb = Recipe.create(name: 'Bacon and Sausage Inside-Out Breakfast Burrito', instructions: 'https://tasty.co/recipe/bacon-sausage-egg-wrapped-breakfast-burrito', meal_id: 1)
add_ingredients_to_recipe(inside_out_bb_ingredients, inside_out_bb)

#cornbread pancakes
cb_pancake_ingredients = [
  {name: 'Bananas', unit: nil, amount: 3},
  {name: 'Sugar', unit: 'cup(s)', amount: 0.3},
  {name: 'Brown Sugar', unit: 'tbsp', amount: 1},
  {name: 'Vanilla Extract', unit: 'tbsp', amount: 1},
  {name: 'Milk', unit: 'cup(s)', amount: 1.5},
  {name: 'Cornmeal', unit: 'cup(s)', amount: 2},
  {name: 'Salt', unit: 'tsp', amount: 1},
  {name: 'Baking Powder', unit: 'tsp', amount: 2},
  {name: 'Cinnimon', unit: 'tsp', amount: 2},
  {name: 'Butter', unit: 'tsp', amount: 1},
  {name: 'Honey', unit: 'some', amount: nil}
]

cb_pancakes = Recipe.create(name: 'Banana Cornbread Pancakes', instructions: 'https://tasty.co/recipe/banana-cornbread-pancakes', meal_id: 1)
add_ingredients_to_recipe(cb_pancake_ingredients, cb_pancakes)

#fiesta tofu scramble
tofu_scramble_ingredients = [
  {name: 'Olive Oil', unit: 'tbsp', amount: 1},
  {name: 'Red Bell Petter', unit: nil, amount: 1},
  {name: 'Jalapeno', unit: nil, amount: 1},
  {name: 'Red Onion', unit: nil, amount: 0.25},
  {name: 'Kosher Salt', unit: 'To Taste', amount: nil},
  {name: 'Extra Firm Tofu', unit: 'oz', amount: 14},
  {name: 'Ground Tumeric', unit: 'tsp', amount: 0.5},
  {name: 'Garlic Powder', unit: 'tsp', amount: 1},
  {name: 'Onion Powder', unit: 'tsp', amount: 0.5},
  {name: 'Pepper', unit: 'To Taste', amount: nil},
  {name: 'Cilantro Leaves', unit: 'cups(s)', amount: 0.25},
  {name: 'Avocado', unit: nil, amount: 0.5},
  {name: 'Lime Wedge', unit: 'For Garnish', amount: nil}
]

tofu_scramble = Recipe.create(name: 'Vegan Fiesta Tofu Scrambe', instructions: 'https://tasty.co/recipe/fiesta-tofu-scramble', meal_id: 1)
add_ingredients_to_recipe(tofu_scramble_ingredients, tofu_scramble)

#mixed berry french toast
berry_french_toast_ingredients = [
  {name: 'Whole Weat Bread', unit: nil, amount: 1},
  {name: 'Honey', unit: 'tbsp', amount: 3},
  {name: 'Warm Water', unit: 'cup(s)', amount: 0.5},
  {name: 'Milk', unit: 'cup(s)', amount: 2},
  {name: 'Eggs', unit: nil, amount: 6},
  {name: 'Vanilla Extract', unit: 'tsp', amount: 2},
  {name: 'Cinnamon', unit: 'tsp', amount: 2},
  {name: 'Salt', unit: 'To Taste', amount: nil},
  {name: 'Blueberry', unit: 'cup(s)', amount: 0.5},
  {name: 'Raspberry', unit: 'cup(s)', amount: 0.5},
  {name: 'Blackberry', unit: 'cup(s)', amount: 0.5},
  {name: 'Maple Syrup', unit: 'To Top', amount: nil}
]

berry_french_toast = Recipe.create(name: 'Mixed Berry French Toast', instructions: 'https://tasty.co/recipe/mixed-berry-french-toast-bake', meal_id: 1)
add_ingredients_to_recipe(berry_french_toast_ingredients, berry_french_toast)











# {name: '', unit: '', amount: 1},
