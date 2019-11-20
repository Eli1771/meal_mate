class DayPlanSerializer
  def initialize(dpObject)
    @day_plan = dpObject
  end

  def to_serialized_json
    @day_plan.to_json(:include => {
      :recipes => {:include => {
        :meal => {:only => [:name]}},
        :only => [:name, :instructions]
      }
    }, :except => [:id, :day_id, :date, :week_plan_id, :created_at, :updated_at])
  end
end

# def initialize(sighting_object)
#   @sighting = sighting_object
# end
