class WeekPlan < ApplicationRecord
  has_many :day_plans
  has_many :recipes, through: :day_plans

  def self.clearAll
    self.all.each do |wp|
      wp.delete
    end
  end
end
