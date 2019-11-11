class DayPlan < ApplicationRecord
  #custom setter/getter methods
  belongs_to :day

  def self.clearAll
    self.all.each do |dp|
      dp.delete
    end
  end

end
