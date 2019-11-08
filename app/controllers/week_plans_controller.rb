class WeekPlansController < ApplicationController
  def index
    week_plan = WeekPlan.find(params[:id])
    render json: week_plan
  end

  def new
  end 

  def create
    week_plan = WeekPlan.create(week_plan_params)
    render json: week_plan
  end

  private

  def week_plan_params
    params.require(:week_plan).permit(:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday)
  end
end
