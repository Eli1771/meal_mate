class AddSlugToDayPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :day_plans, :slug, :string
    add_index :day_plans, :slug
  end
end
