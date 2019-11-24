class CreateMigrations < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :bulk, :boolean
  end
end
