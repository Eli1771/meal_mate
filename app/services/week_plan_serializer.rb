class WeekPlanSerializer
  def initialize(wpObject)
    @week_plan = wpObject
  end

  def to_serialized_json
    
  end
end

# "#<NoMethodError: undefined method `except' for #<WeekPlan:0x00007fab1edd17f8>
# Did you mean?  exec>"

# @day_plan.to_json(:include => {
#   :breakfast_recipe => {
#     :include => {:ingredients => {:only => :name}},
#     :only => :name},
#   :lunch_recipe => {
#     :include => {:ingredients => {:only => :name}},
#     :only => :name},
#   :dinner_recipe => {
#     :include => {:ingredients => {:only => :name}},
#     :only => :name},
# }, :except => [:created_at, :updated_at])
