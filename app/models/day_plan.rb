class DayPlan < ApplicationRecord
  #custom setter/getter methods
  belongs_to :day
  belongs_to :week_plan
  has_many :recipe_plans
  has_many :recipes, through: :recipe_plans

  def self.clearAll
    self.all.each do |dp|
      dp.delete
    end
  end

end
