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

#bell pepper egg rings
pepper_egg_ingredients = [
  {name: 'Eggs', unit: nil, amount: 2},
  {name: 'Yellow Bell Pepper', unit: nil, amount: 1},
  {name: 'Salt', unit: 'To Taste', amount: nil},
  {name: 'Pepper', unit: 'To Taste', amount: nil},
]

pepper_eggs = Recipe.create(name: 'Bell Pepper Egg Rings', instructions: 'https://tasty.co/recipe/bell-pepper-egg-rings', meal_id: 1)
add_ingredients_to_recipe(pepper_egg_ingredients, pepper_eggs)

#banana almond oatmeal
banana_oatmeal_ingredients = {
  {name: 'Instant Oatmeal', unit: 'cup(s)', amount: 0.5},
  {name: 'Salt', unit: 'To Taste', amount: nil},
  {name: 'Cinnamon', unit: 'To Taste', amount: nil},
  {name: 'Banana', unit: nil, amount: 1},
  {name: 'Almonds', unit: 'cup(s)', amount: 0.25}
}

banana_oatmeal = Recipe.create(name: 'Banana Almond Oatmeal' instructions: 'https://tasty.co/recipe/banana-almond-oatmeal', meal_id: 1)
add_ingredients_to_recipe(banana_oatmeal_ingredients, banana_oatmeal)

#spinach sweet potato quiche
sp_quiche_ingredients = [
  {name: 'Sweet Potato', unit: nil, amount: 1},
  {name: 'Olive Oil', unit: 'drizzle', amount: nil},
  {name: 'Salt', unit: 'To Taste', amount: nil},
  {name: 'Pepper', unit: 'To Taste', amount: nil},
  {name: 'Eggs', unit: nil, amount: 4},
  {name: 'Milk', unit: 'cup(s)', amount: 1.5},
  {name: 'Garlic', unit: 'clove(s)', amount: 1},
  {name: 'Sun-Dried Tomato', unit: 'oz', amount: 4},
  {name: 'Baby Spinach', unit: 'oz', amount: 3},
  {name: 'Goat Cheese', unit: 'oz', amount: 4}
]

sp_quiche = Recipe.create(name: 'Spinach and Sweet Potato Quiche', instructions: 'https://tasty.co/recipe/spinach-sun-dried-tomato-sweet-potato-crusted-quiche', meal_id: 1)
add_ingredients_to_recipe(sp_quiche_ingredients, sp_quiche)

#waffle breakfast sandwich
waffle_sandwich_ingredients = [
  {name: 'Sausage Patty', unit: nil, amount: 1},
  {name: 'Eggs', unit: nil, amount: 1},
  {name: 'Salt', unit: 'To Taste', amount: nil},
  {name: 'Pepper', unit: 'To Taste', amount: nil},
  {name: 'Milk', unit: 'tsp', amount: 1},
  {name: 'Cheddar Cheese', unit: 'slice(s)', amount: 2},
  {name: 'Frozen Waffles', unit: nil, amount: 2}
]

waffle_sandwich = Recipe.create(name: 'Waffle Breakfast Sandwich', instructions: 'https://tasty.co/recipe/waffle-breakfast-sandwich', meal_id: 1)
add_ingredients_to_recipe(waffle_sandwich_ingredients, waffle_sandwich)

#breakfast potatoes
breakfast_potatoes_ingredients = [
  {name: 'Russet Potatoes', unit: nil, amount: 3},
  {name: 'Red Bell Pepper', unit: nil, amount: 1},
  {name: 'White Onion', unit: nil, amount: 1},
  {name: 'Olive Oil', unit: 'To Taste', amount: nil},
  {name: 'Dried Rosemary', unit: 'tbsp', amount: 1},
  {name: 'Minced Garlic', unit: 'tbsp', amount: 1},
  {name: 'Paprika', unit: 'tsp', amount: 1},
  {name: 'Salt', unit: 'tsp', amount: 1},
  {name: 'Pepper', unit: 'tsp', amount: 1}
]

breakfast_potatoes = Recipe.create(name: 'One-Pan Breakfast Potatoes', instructions: 'https://tasty.co/recipe/one-pan-breakfast-potatoes', meal_id: 1)
add_ingredients_to_recipe(breakfast_potatoes_ingredients, breakfast_potatoes)

#bacon egg cups
bacon_egg_cups_ingredients = [
  {name: 'Bacon', unit: 'slice(s)', amount: 6},
  {name: 'Eggs', unit: nil, amount: 6},
  {name: 'Salt', unit: 'To Taste', amount: nil},
  {name: 'Pepper', unit: 'To Taste', amount: nil},
  {name: 'Shredded Cheddar Cheese', unit: 'cup(s)', amount: 0.25},
  {name: 'Chives', unit: 'To Taste', amount: nil}
]

bacon_egg_cups = Recipe.create(name: 'Bacon Egg Cups', instructions: 'https://tasty.co/recipe/bacon-egg-cups', meal_id: 1)
add_ingredients_to_recipe(bacon_egg_cups_ingredients, bacon_egg_cups)

#savoury white fish with simmered tomatoes
white_fish_ingredients = [
  {name: 'Olive Oil', unit: 'tbsp', amount: 2},
  {name: 'Garlic', unit: 'clove(s)', amount: 3},
  {name: 'Savory Spice Blend', unit: 'tsp', amount: 2},
  {name: 'Canned Whole Tomatoes', unit: 'oz', amount: 14.5},
  {name: 'White Wine', unit: 'cup(s)', amount: 0.25},
  {name: 'Bay Leaves', unit: nil, amount: 3},
  {name: 'Kosher Salt', unit: 'To Taste', amount: nil},
  {name: 'Black Pepper', unit: 'To Taste', amount: nil},
  {name: 'White Fish Fillet ', unit: 'oz', amount: 24},
  {name: 'Fresh Basil', unit: 'cup(s)', amount: 0.25}
]

white_fish = Recipe.create(name: 'Savoury White Fish', instructions: 'https://tasty.co/recipe/savoury-white-fish-with-simmered-tomatoes', meal_id: 3)
add_ingredients_to_recipe(white_fish_ingredients, white_fish)

#slow cooker pot roast
pot_roast_ingredients = [
  {name: 'Chuck Roast', unit: 'lb', amount: 3},
  {name: 'Salt', unit: 'To Taste', amount: nil},
  {name: 'Pepper', unit: 'To Taste', amount: nil},
  {name: 'Dried Onion Soup Mix', unit: 'oz', amount: 1},
  {name: 'Onion', unit: nil, amount: 1},
  {name: 'Gold Potatoes', unit: nil, amount: 3},
  {name: 'Large Carrots', unit: nil, amount: 3},
  {name: 'Water', unit: 'cup(s)', amount: 0.5}
]

pot_roast = Recipe.create(name: 'Slow Cooker Pot Roast', instructions: 'https://tasty.co/recipe/slow-cooker-pot-roast', meal_id: 3)
add_ingredients_to_recipe(pot_roast_ingredients, pot_roast)

#slow cooker stuffed peppers
sc_stuffed_pepper_ingredients = [
  {name: 'Bell Peppers', unit: nil, amount: 5},
  {name: 'Cookes Rice', unit: 'cup(s)', amount: 2},
  {name: 'Salt', unit: 'To Taste', amount: nil},
  {name: 'Pepper', unit: 'To Taste', amount: nil},
  {name: 'Corn', unit: 'can', amount: 1},
  {name: 'Onion', unit: nil, amount: 0.5},
  {name: 'Black Beans', unit: 'can', amount: 1},
  {name: 'Tomato', unit: 'cup(s)', amount: 0.5},
  {name: 'Salsa', unit: 'cup(s)', amount: 0.5},
  {name: 'Shredded Cheddar Cheese', unit: 'cup(s)', amount: 2},
  {name: 'Chicken Stock', unit: 'cup(s)', amount: 0.5}
]

sc_stuffed_peppers = Recipe.create(name: 'Slow Cooker Stuffed Peppers', instructions: 'https://tasty.co/recipe/slow-cooker-stuffed-peppers', meal_id: 3)
add_ingredients_to_recipe(sc_stuffed_pepper_ingredients, sc_stuffed_peppers)

#creamy tuscan chicken
tuscan_chicken_ingredients = [
  {name: 'Chicken Thighs', unit: nil, amount: 4},
  {name: 'Salt', unit: 'tsp', amount: 2},
  {name: 'Pepper', unit: 'tsp', amount: 1},
  {name: 'Oil', unit: 'tbsp', amount: 1},
  {name: 'Garlic', unit: 'clove(s)', amount: 3},
  {name: 'Onion', unit: nil, amount: 0.5},
  {name: 'Tomato', unit: nil, amount: 1},
  {name: 'Spinach', unit: 'cup(s)', amount: 2},
  {name: 'Heavy Cream', unit: 'cup(s)', amount: 2},
  {name: 'Salt', unit: 'tsp', amount: 1},
  {name: 'Pepper', unit: 'tsp', amount: 1},
  {name: 'Grated Parmesan', unit: 'cup(s)', amount: 0.5},
  {name: 'Parsley', unit: 'tbsp', amount: 2}
]

tuscan_chicken = Recipe.create(name: 'Creamy Tuscan Chicken', instructions: 'https://tasty.co/recipe/creamy-tuscan-chicken', meal_id: 3)
add_ingredients_to_recipe(tuscan_chicken_ingredients, tuscan_chicken)

#chili cheese dong boats
chili_dog_ingredients = [
  {name: 'Hot Dog Buns', unit: nil, amount: 8},
  {name: 'Butter', unit: 'tbsp', amount: 4},
  {name: 'Garlic', unit: 'clove(s)', amount: 2},
  {name: 'Parsley', unit: 'tbsp', amount: 2},
  {name: 'Cheddar Cheese', unit: 'slice(s)', amount: 8},
  {name: 'Chili', unit: 'oz', amount: 15},
  {name: 'Hot Dogs', unit: nil, amount: 8}
]

chili_dog = Recipe.create(name: 'Chili Cheese Dog Boats', instructions: 'https://tasty.co/recipe/chili-cheese-dog-boats', meal_id: 3)
add_ingredients_to_recipe(chili_dog_ingredients, chili_dog)

#salt and binegar crisp battered fish
snv_fish_ingredients = [
  {name: 'Fish', unit: nil, amount: 2},
  {name: 'Salt and Vinegar Chips', unit: 'cup(s)', amount: 4.5},
  {name: 'Flour', unit: 'cup(s)', amount: 0.75},
  {name: 'Baking Soda', unit: 'tsp', amount: 2},
  {name: 'Salt', unit: 'To Taste', amount: nil},
  {name: 'Beer', unit: 'cup(s)', amount: 1}
]

snv_fish = Recipe.create(name: 'Salt and Vinegar Crisp Battered Fish', instructions: 'https://tasty.co/recipe/salt-and-vinegar-crisp-battered-fish', meal_id: 2)
add_ingredients_to_recipe(snv_fish_ingredients, snv_fish)

#ratatouille
ratatouille_ingredients = [
  {name: 'Eggplants', unit: nil, amount: 2},
  {name: 'Roma Tomatoes', unit: nil, amount: 6},
  {name: 'Yellow Squashes', unit: nil, amount: 2},
  {name: 'Zucchinis', unit: nil, amount: 2},
  {name: 'Olive Oil', unit: 'tbsp', amount: 2},
  {name: 'Onion', unit: nil, amount: 1},
  {name: 'Garlic', unit: 'clove(s)', amount: 4},
  {name: 'Red Bell Pepper', unit: nil, amount: 1},
  {name: 'Yellow Bell Pepper', unit: nil, amount: 1},
  {name: 'Salt', unit: 'To Taste', amount: nil},
  {name: 'Pepper', unit: 'To Taste', amount: nil},
  {name: 'Crushed Tomatoes', unit: 'oz', amount: 28},
  {name: 'Basil', unit: 'tbsp', amount: 4},
  {name: 'Parsley', unit: 'tbsp', amount: 2},
  {name: 'Thyme', unit: 'tsp', amount: 2},
  {name: 'Olive Oil', unit: 'tbsp', amount: 4}
]

ratatouille = Recipe.create(name: 'Ratatouille', instructions: 'https://tasty.co/recipe/ratatouille', meal_id: 3)
add_ingredients_to_recipe(ratatouille_ingredients, ratatouille)







# {name: '', unit: '', amount: 1},
