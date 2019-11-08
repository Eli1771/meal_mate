class WeekPlansController < ApplicationController
  def index
    week_plan = WeekPlan.find(params[:id])
    render json: week_plan
  end

  def create
    week_plan = WeekPlan.create(params)
    render json: week_plan
  end 
end
