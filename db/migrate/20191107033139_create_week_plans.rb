class CreateWeekPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :week_plans do |t|
      t.string :startDate
      t.string :endDate

      t.timestamps
    end
  end
end
