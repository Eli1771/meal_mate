class WeekPlanSerializer
  def initialize(wpObject)
    @week_plan = wpObject
  end

  def to_serialized_json
    @week_plan.to_json(:include => {
      :sunday_plan => {
        :include => {
          :breakfast_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
          :lunch_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
          :dinner_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
        },
        :only => :date,
        :except => :id
      },
      :monday_plan => {
        :include => {
          :breakfast_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
          :lunch_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
          :dinner_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
        },
        :only => :date,
        :except => :id
      },
      :tuesday_plan => {
        :include => {
          :breakfast_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
          :lunch_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
          :dinner_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
        },
        :only => :date,
        :except => :id
      },
      :wednesday_plan => {
        :include => {
          :breakfast_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
          :lunch_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
          :dinner_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
        },
        :only => :date,
        :except => :id
      },
      :thursday_plan => {
        :include => {
          :breakfast_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
          :lunch_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
          :dinner_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
        },
        :only => :date,
        :except => :id
      },
      :friday_plan => {
        :include => {
          :breakfast_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
          :lunch_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
          :dinner_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
        },
        :only => :date,
        :except => :id
      },
      :saturday_plan => {
        :include => {
          :breakfast_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
          :lunch_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
          :dinner_recipe => {
            :include => {:ingredients => {:only => :name}},
            :only => :name},
        },
        :only => :date,
        :except => :id
      }
    }, :except => [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :created_at, :updated_at])
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
