class CreateWeekPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :week_plans do |t|
      t.integer :sunday
      t.integer :monday
      t.integer :tuesday
      t.integer :wednesday
      t.integer :thurdsay
      t.integer :friday
      t.integer :saturday
      t.boolean :current

      t.timestamps
    end
  end
end
