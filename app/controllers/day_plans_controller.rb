require 'pry'

class DayPlansController < ApplicationController
  def show
    day = DayPlan.find(params[:id])
    render json: day
  end

  def new
  end

  def create
    # binding.pry
    day = DayPlan.new(day_plan_params)
    day.save
    json = DayPlanSerializer.new(day)
    render json: json.to_serialized_json
  end

  private

  def day_plan_params
    params.require(:day_plan).permit(:date, :breakfast, :lunch, :dinner)
  end
end
