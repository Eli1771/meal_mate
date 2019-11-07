class DayPlan < ApplicationRecord
  belongs_to :week_plan


  def self.clearAll
    self.all.each do |dp|
      dp.delete
    end
  end

end
