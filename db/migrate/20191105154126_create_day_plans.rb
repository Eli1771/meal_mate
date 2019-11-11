class CreateDayPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :day_plans do |t|
      t.references :day, foreign_key: true
      t.string :date
      t.integer :breakfast
      t.integer :lunch
      t.integer :dinner

      t.timestamps
    end
  end
end
