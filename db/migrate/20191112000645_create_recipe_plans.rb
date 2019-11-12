class CreateRecipePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_plans do |t|
      t.references :recipe, foreign_key: true
      t.references :day_plan, foreign_key: true

      t.timestamps
    end
  end
end
