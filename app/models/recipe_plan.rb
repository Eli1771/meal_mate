class RecipePlan < ApplicationRecord
  belongs_to :recipe
  belongs_to :day_plan

  def self.clearAll
    self.all.each do |rp|
      rp.delete
    end
  end 
end
