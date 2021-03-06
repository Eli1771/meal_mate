class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe, foreign_key: true
      t.references :ingredient, foreign_key: true
      t.string :unit
      t.string :amount

      t.timestamps
    end
  end
end
