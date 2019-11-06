class DayPlan < ApplicationRecord


  def self.clearAll
    self.all.each do |dp|
      dp.delete
    end
  end

end
