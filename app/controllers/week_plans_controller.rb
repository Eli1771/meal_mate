class WeekPlansController < ApplicationController
  def show
    week_plan = WeekPlan.find_by(slug: params[:slug])
    render json: WeekPlanSerializer.new(week_plan).to_serialized_json
  end

  def create
    week_plan = WeekPlan.create(week_plan_params)
    render json: week_plan
  end

  private

  def week_plan_params
    params.require(:week_plan).permit(:start_date, :slug)
  end
end
