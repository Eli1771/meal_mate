class WeekPlansController < ApplicationController
  def index
    week_plan = WeekPlan.find(params[:id])
    render json: week_plan
  end

  def create
    week_plan = WeekPlan.create(week_plan_params)
    render json: week_plan
    # render json: WeekPlanSerializer.new(week_plan).to_serialized_json
  end

  private

  def week_plan_params
    params.require(:week_plan).permit(:start_date)
  end
end
