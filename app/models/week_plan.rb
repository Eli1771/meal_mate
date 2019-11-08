class WeekPlan < ApplicationRecord

  def sunday_plan
    DayPlan.find(self.sunday)
  end
  def monday_plan
    DayPlan.find(self.monday)
  end
  def tuesday_plan
    DayPlan.find(self.tuesday)
  end
  def wednesday_plan
    DayPlan.find(self.wednesday)
  end
  def thursday_plan
    DayPlan.find(self.thursday)
  end
  def friday_plan
    DayPlan.find(self.friday)
  end
  def saturday_plan
    DayPlan.find(self.saturday)
  end

  def self.clearAll
    self.all.each do |wp|
      wp.delete
    end
  end
end
