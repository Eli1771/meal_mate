class AddSlugToWeekPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :week_plans, :slug, :string
    add_index :week_plans, :slug
  end
end
