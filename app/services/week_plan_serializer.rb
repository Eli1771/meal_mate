class WeekPlanSerializer
  def initialize(wpObject)
    @week_plan = wpObject
  end

  def to_serialized_json
    @week_plan.to_json(:include => {
      :day_plans => {:include => {
        :day => {:only => [:name]},
        :recipes => {:include => {
          :meal => {:only => [:name]},
          :recipe_ingredients => {:include => {
            :ingredient => {:only => [:name]}
          }, :only => [:amount, :unit]}
        }, :only => [:name, ]},
      }, :only => [:date]}
    }, :except => [:id, :created_at, :updated_at]);
  end
end
