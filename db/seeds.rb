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

#3 ingredient chicken teriyaki
simple_teriyaki_ingredients = [
  {name: 'Chicken Thighs', unit: 'lb', amount: 2},
  {name: 'Soy Sauce', unit: 'cup(s)', amount: 1},
  {name: 'Brown Sugar', unit: 'cup(s)', amount: 0.5},
]

simple_teriyaki = Recipe.create(name: '3 Ingredient Teriyaki Chicken', instructions: 'https://tasty.co/recipe/3-ingredient-teriyaki-chicken', meal_id: 3)
add_ingredients_to_recipe(simple_teriyaki_ingredients, simple_teriyaki)

#veggie cauliflower fried rice
cauliflower_rice_ingredients = [
  {name: 'Cauliflower', unit: 'head(s)', amount: 1},
  {name: 'Onion', unit: nil, amount: 0.5},
  {name: 'Red Bell Pepper', unit: nil, amount: 1},
  {name: 'Green Bell Pepper', unit: nil, amount: 1},
  {name: 'Yellow Bell Pepper', unit: nil, amount: 1},
  {name: 'Mushroom', unit: 'cup(s)', amount: 2},
  {name: 'Salt', unit: 'tsp', amount: 2},
  {name: 'Pepper', unit: 'tsp', amount: 1},
  {name: 'Eggs', unit: nil, amount: 3}
]

cauliflower_rice = Recipe.create(name: 'Veggie Cauliflower Fried Rice', instructions: 'https://tasty.co/recipe/veggie-cauliflower-fried-rice', meal_id: 3)
add_ingredients_to_recipe(cauliflower_rice_ingredients, cauliflower_rice)

#slow cooker ribs
sc_ribs_ingredients = [
  {name: 'BBQ Sauce', unit: 'cup(s)', amount: 2},
  {name: 'Brown Suger', unit: 'cup(s)', amount: 0.25},
  {name: 'Apple Cider Vinegar', unit: 'tbsp', amount: 4},
  {name: 'Dried Oregano', unit: 'tsp', amount: 3},
  {name: 'Worcestershire Sauce', unit: 'tsp', amount: 1},
  {name: 'Cayenne Pepper', unit: 'tbsp', amount: 1},
  {name: 'Chili Powder', unit: 'tbsp', amount: 1},
  {name: 'Baby Back Pork Rib', unit: 'lb', amount: 3},
  {name: 'Salt', unit: 'To Taste', amount: nil},
  {name: 'Pepper', unit: 'To Taste', amount: nil}
]

sc_ribs = Recipe.create(name: 'Slow Cooker BBQ Ribs', instructions: 'https://tasty.co/recipe/slow-cooker-ribs', meal_id: 3)
add_ingredients_to_recipe(sc_ribs_ingredients, sc_ribs)

#sheet pan jambalaya
jambalaya_ingredients = [
  {name: 'Yellow Onion', unit: nil, amount: 1},
  {name: 'Red Bell Pepper', unit: nil, amount: 1},
  {name: 'Green Bell Pepper', unit: nil, amount: 1},
  {name: 'Yellow Bell Pepper', unit: nil, amount: 1},
  {name: 'Chicken Sausage', unit: 'cup(s)', amount: 2},
  {name: 'Olive Oil', unit: 'To Taste', amount: nil},
  {name: 'Creole Seasoning', unit: 'tbsp', amount: 1.25},
  {name: 'Shrimp', unit: 'lb', amount: 1},
  {name: 'Paprika', unit: 'tsp', amount: 0.5},
  {name: 'Tomato', unit: 'cup(s)', amount: 1.5},
  {name: 'Cooked Rice', unit: 'cup(s)', amount: 4},
  {name: 'Scallion', unit: 'some', amount: nil}
]

jambalaya = Recipe.create(name: 'Sheet Pan Jambalaya', instructions: 'https://tasty.co/recipe/sheet-pan-jambalaya', meal_id: 3)
add_ingredients_to_recipe(jambalaya_ingredients, jambalaya)

#creamy chicken penne
chicken_penne_ingredients = [
  {name: 'Bacon', unit: 'slice(s)', amount: 4},
  {name: 'Chicken Breasts', unit: nil, amount: 3},
  {name: 'Salt', unit: 'To Taste', amount: nil},
  {name: 'Pepper', unit: 'To Taste', amount: nil},
  {name: 'Italian Seasoning', unit: 'tsp', amount: 2},
  {name: 'Paprika', unit: 'tsp', amount: 1},
  {name: 'Garlic', unit: 'clove(s)', amount: 2},
  {name: 'Spinach', unit: 'cup(s)', amount: 2},
  {name: 'Diced Tomatoes', unit: nil, amount: 4},
  {name: 'Cream', unit: 'cup(s)', amount: 1.5},
  {name: 'Shredded Parmesan', unit: 'cup(s)', amount: 1},
  {name: 'Red Pepper Flakes', unit: 'tsp', amount: 0.5},
  {name: 'Penne', unit: 'oz', amount: 10},
  {name: 'Chopped Parsley', unit: 'tbsp', amount: 3}
]

chicken_penne = Recipe.create(name: 'Creamy Chicken Penne Pasta', instructions: 'https://tasty.co/recipe/creamy-chicken-penne-pasta', meal_id: 2)
add_ingredients_to_recipe(chicken_penne_ingredients, chicken_penne)

#one-pot cheeseburger pasta
cb_pasta_ingredients = [
  {name: 'Ground Beef', unit: 'lb', amount: 1},
  {name: 'Onion', unit: 'cup(s)', amount: 1},
  {name: 'Garlic', unit: 'tbsp', amount: 1},
  {name: 'Salt', unit: 'tsp', amount: 1},
  {name: 'Pepper', unit: 'tsp', amount: 0.5},
  {name: 'Worcestershire Sauce', unit: 'tbsp', amount: 2},
  {name: 'Ketchup', unit: 'tbsp', amount: 2},
  {name: 'Beef Broth', unit: 'cup(s)', amount: 4},
  {name: 'Fusilli Pasta', unit: 'oz', amount: 16},
  {name: 'Shredded Cheddar', unit: 'cup(s)', amount: 3},
  {name: 'Milk', unit: 'cup(s)', amount: 0.5},
  {name: 'Green Onion', unit: 'some', amount: nil}
]

cb_pasta = Recipe.create(name: 'One-Pot Cheeseburger Pasta', instructions: 'https://tasty.co/recipe/one-pot-cheeseburger-pasta', meal_id: 2)
add_ingredients_to_recipe(cb_pasta_ingredients, cb_pasta)

#chicken parm sliders
cp_sliders_ingredients = [
  {name: '12 Pack Dinner Rolls', unit: nil, amount: 1},
  {name: 'Shredded Rotisserie Chicken', unit: 'cup(s)', amount: 3},
  {name: 'Marinara Sauce', unit: 'cup(s)', amount: 0.5},
  {name: 'Sliced Mozzarella', unit: 'oz', amount: 8},
  {name: 'Basil', unit: 'cup(s)', amount: 0.25},
  {name: 'Butter', unit: 'cup(s)', amount: 0.5},
  {name: 'Garlic', unit: 'clove(s)', amount: 3},
  {name: 'Parsley', unit: 'tbsp', amount: 2},
  {name: 'Grated Parmesan', unit: 'tbsp', amount: 2}
]

cp_sliders = Recipe.create(name: 'Chicken Parmesan Sliders', instructions: 'https://tasty.co/recipe/chicken-parmesan-sliders', meal_id: 2)
add_ingredients_to_recipe(cp_sliders_ingredients, cp_sliders)

#creamy pesto pasta
pesto_pasta_ingredients = [
  {name: 'Basil', unit: 'cup(s)', amount: 4},
  {name: 'Garlic', unit: 'clove(s)', amount: 2},
  {name: 'Pine Nuts', unit: 'cup(s)', amount: 0.5},
  {name: 'Grated Parmesan', unit: 'cup(s)', amount: 1.75},
  {name: 'Olive Oil', unit: 'cup(s)', amount: 0.75},
  {name: 'Cold Water', unit: 'cup(s)', amount: 0.25},
  {name: 'Heavy Cream', unit: 'cup(s)', amount: 0.5},
  {name: 'Salt', unit: 'tsp', amount: 1},
  {name: 'Pepper', unit: 'tsp', amount: 0.5},
  {name: 'Fusilli Pasta', unit: 'oz', amount: 12},
  {name: 'Cherry Tomato', unit: 'cup(s)', amount: 1},
  {name: 'Mozzarella Ball', unit: 'oz', amount: 8}
]

pesto_pasta = Recipe.create(name: 'Creamy Pesto Pasta', instructions: 'https://tasty.co/recipe/creamy-pesto-pasta-bake', meal_id: 2)
add_ingredients_to_recipe(pesto_pasta_ingredients, pesto_pasta)

#creamy mushroom toasts
mushroom_toasts_ingredients = [
  {name: 'Olive Oil', unit: 'tbsp', amount: 1},
  {name: 'Garlic', unit: 'clove(s)', amount: 3},
  {name: 'Paprika', unit: 'tsp', amount: 1},
  {name: 'Mushroom', unit: 'oz', amount: 14},
  {name: 'Salt', unit: 'tsp', amount: 1},
  {name: 'Heavy Cream', unit: 'cup(s)', amount: 0.25},
  {name: 'Scallions', unit: nil, amount: 3},
  {name: 'Bread', unit: 'slice(s)', amount: 4},
  {name: 'Eggs', unit: nil, amount: 4}
]

mushroom_toasts = Recipe.create(name: 'Creamy Mushroom Toasts', instructions: 'https://tasty.co/recipe/creamy-mushroom-toasts', meal_id: 2)
add_ingredients_to_recipe(mushroom_toasts_ingredients, mushroom_toasts)

#creamy cajun pasta
cajun_pasta_ingredients = [
  {name: 'Unsalted Butter', unit: 'tbsp', amount: 2},
  {name: 'Spicy Italian Sausage', unit: 'lb', amount: 1},
  {name: 'Salt', unit: 'To Taste', amount: nil},
  {name: 'Yellow Onion', unit: nil, amount: 1},
  {name: 'Jalapeno', unit: nil, amount: 1},
  {name: 'Garlic', unit: 'tbsp', amount: 1},
  {name: 'Tomato Paste', unit: 'tbsp', amount: 1},
  {name: 'Jazzy Spice Blend', unit: 'tbsp', amount: 2},
  {name: 'Dried Penne', unit: 'lb', amount: 1},
  {name: 'Red Bell Pepper', unit: nil, amount: 1},
  {name: 'Green Bell Pepper', unit: nil, amount: 1},
  {name: 'Mushroom', unit: 'oz', amount: 8},
  {name: 'Fire-Roasted Tomato', unit: 'oz', amount: 14.5},
  {name: 'Chicken Stock', unit: 'cup(s)', amount: 4},
  {name: 'Cream Cheese', unit: 'oz', amount: 5},
  {name: 'Scallions', unit: nil, amount: 2}
]

cajun_pasta = Recipe.create(name: 'Creamy Cajun Pasta', instructions: 'https://tasty.co/recipe/creamy-cajun-pasta', meal_id: 2)
add_ingredients_to_recipe(cajun_pasta_ingredients, cajun_pasta)

#cream of mushroom soup
mushroom_soup_ingredients = [
  {name: 'Salted Butter', unit: 'tbsp', amount: 2},
  {name: 'Yellow Onion', unit: 'cups(s)', amount: 1},
  {name: 'Garlic', unit: 'clove(s)', amount: 2},
  {name: 'White Button Mushroom', unit: 'cups(s)', amount: 1},
  {name: 'Cremini Mushroom', unit: 'cups(s)', amount: 1},
  {name: 'Shiitake Mushroom', unit: 'cups(s)', amount: 1},
  {name: 'Salt', unit: 'tsp', amount: 1},
  {name: 'Pepper', unit: 'tsp', amount: 1},
  {name: 'Flour', unit: 'tbsp', amount: 2},
  {name: 'White Wine', unit: 'cups(s)', amount: 0.25},
  {name: 'Vegetable Stock', unit: 'cups(s)', amount: 4},
  {name: 'Heavy Cream', unit: 'cups(s)', amount: 0.3},
  {name: 'Parsley', unit: 'sprig', amount: 1}
]

mushroom_soup = Recipe.create(name: 'Cream of Mushroom Soup', instructions: 'https://tasty.co/recipe/the-only-cream-of-mushroom-soup-recipe-youll-ever-need', meal_id: 2)
add_ingredients_to_recipe(mushroom_soup_ingredients, mushroom_soup)

#zesty salmon burgers
salmon_burgers_ingredients = [
  {name: 'Yogurt', unit: 'cup(s)', amount: 0.25},
  {name: 'Spicy Dijon', unit: 'tbsp', amount: 2},
  {name: 'Dill', unit: 'tbsp', amount: 2},
  {name: 'Chives', unit: 'tbsp', amount: 2},
  {name: 'Honey', unit: 'tsp', amount: 2},
  {name: 'Skinless Salmon', unit: 'oz', amount: 16},
  {name: 'Red Onion', unit: nil, amount: 0.5},
  {name: 'Horseradish', unit: 'tbsp', amount: 1},
  {name: 'Salt', unit: 'tsp', amount: 1.5},
  {name: 'Pepper', unit: 'tsp', amount: 0.5}
]

salmon_burgers = Recipe.create(name: 'Zesty Salmon Burgers', instructions: 'https://tasty.co/recipe/easy-zesty-salmon-burgers', meal_id: 2)
add_ingredients_to_recipe(salmon_burgers_ingredients, salmon_burgers)

#sumer picnic sandwich
picnic_sandwich_ingredients = [
  {name: 'Mayonnaise', unit: 'cup(s)', amount: 0.5},
  {name: 'Basil', unit: 'cup(s)', amount: 0.3},
  {name: 'Salt', unit: 'tsp', amount: 0.25},
  {name: 'Garlic Powder', unit: 'tsp', amount: 0.5},
  {name: 'Lemon, Zested', unit: nil, amount: 1},
  {name: 'Sourdough Loaf Boule', unit: 'lb', amount: 1},
  {name: 'Ham', unit: 'slice(s)', amount: 4},
  {name: 'Mozzarella', unit: 'oz', amount: 6},
  {name: 'Roasted Red Pepper', unit: 'cup(s)', amount: 0.5},
  {name: 'Tomato', unit: 'oz', amount: 6},
  {name: 'Red Onion', unit: 'cup(s)', amount: 0.25},
  {name: 'Green Olives', unit: 'cup(s)', amount: 0.25}
]

picnic_sandwich = Recipe.create(name: 'Summer Picnec Sandwich', instructions: 'https://tasty.co/recipe/summer-picnic-sandwich', meal_id: 2)
add_ingredients_to_recipe(picnic_sandwich_ingredients, picnic_sandwich)

#bbq chicken bacon skewers
bbq_skewers_ingredients = [
  {name: 'Chicken Thighs', unit: 'lb', amount: 1},
  {name: 'BBQ Sauce', unit: 'cup(s)', amount: 1},
  {name: 'Salt', unit: 'tsp', amount: 1},
  {name: 'Pepper', unit: 'tsp', amount: 1},
  {name: 'Bacon', unit: 'strip(s)', amount: 4}
]

bbq_skewers = Recipe.create(name: 'BBQ Chicken Bacon Skewers', instructions: 'https://tasty.co/recipe/bbq-chicken-bacon-skewers', meal_id: 2)
add_ingredients_to_recipe(bbq_skewers_ingredients, bbq_skewers)

#veggie fried rice
veggie_rice_ingredients = [
  {name: 'Brown Rice', unit: 'cup(s)', amount: 2},
  {name: 'Vegetable Broth', unit: 'cup(s)', amount: 2},
  {name: 'Carrots', unit: nil, amount: 2},
  {name: 'Oil', unit: 'tbsp', amount: 1},
  {name: 'White Onion', unit: nil, amount: 0.5},
  {name: 'Garlic', unit: 'clove(s)', amount: 2},
  {name: 'Frozen Peas', unit: 'cup(s)', amount: 0.5},
  {name: 'Salt', unit: 'To Taste', amount: nil},
  {name: 'Pepper', unit: 'To Taste', amount: nil},
  {name: 'Eggs', unit: nil, amount: 2},
  {name: 'Scallion', unit: 'some', amount: nil}
]

veggie_rice = Recipe.create(name: 'Veggie Fried Rice', instructions: 'https://tasty.co/recipe/healthier-veggie-fried-rice', meal_id: 2)
add_ingredients_to_recipe(veggie_rice_ingredients, veggie_rice)

#pizza braid
pizza_braid_ingredients = [
  {name: 'Puff Pastry', unit: nil, amount: 1},
  {name: 'Mozzarella', unit: 'slice(s)', amount: 4},
  {name: 'Pepperoni', unit: 'slice(s)', amount: 12},
  {name: 'Butter', unit: 'tbsp', amount: 2},
  {name: 'Garlic', unit: 'clove(s)', amount: 1},
  {name: 'Parsley', unit: 'tbsp', amount: 1},
  {name: 'Parmesan', unit: 'tbsp', amount: 1},
  {name: 'Marinara Sauce', unit: 'For Dipping', amount: nil}
]

pizza_braid = Recipe.create(name: 'Pizza Braid', instructions: 'https://tasty.co/recipe/pizza-braid', meal_id: 2)
add_ingredients_to_recipe(pizza_braid_ingredients, pizza_braid)
