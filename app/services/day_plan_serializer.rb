class DayPlanSerializer
  def initialize(dpObject)
    @day_plan = dpObject
  end

  def to_serialized_json
    @day_plan.to_json(:include => {
      :breakfast_recipe => {
        :include => {:ingredients => {:only => :name}},
        :only => :name},
      :lunch_recipe => {
        :include => {:ingredients => {:only => :name}},
        :only => :name},
      :dinner_recipe => {
        :include => {:ingredients => {:only => :name}},
        :only => :name},
    }, :except => [:created_at, :updated_at])
  end
end

# def initialize(sighting_object)
#   @sighting = sighting_object
# end
