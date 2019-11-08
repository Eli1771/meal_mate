class DayPlan < ApplicationRecord
  #custom setter/getter methods

  def breakfast_recipe
    Recipe.find(self.breakfast)
  end

  def self.clearAll
    self.all.each do |dp|
      dp.delete
    end
  end

end
