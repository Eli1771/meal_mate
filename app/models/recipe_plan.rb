class RecipePlan < ApplicationRecord
  belongs_to :recipe
  belongs_to :day_plan
end
