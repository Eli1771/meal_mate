class DayPlan < ApplicationRecord
  #custom setter/getter methods

  def breakfast_recipe
    Recipe.find(self.breakfast)
  end
  def lunch_recipe
    Recipe.find(self.lunch)
  end
  def dinner_recipe
    Recipe.find(self.lunch)
  end

  def self.clearAll
    self.all.each do |dp|
      dp.delete
    end
  end

end
