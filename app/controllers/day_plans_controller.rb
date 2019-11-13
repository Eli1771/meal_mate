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
    day = DayPlan.create(day_plan_params)
    render json: DayPlanSerializer.new(day).to_serialized_json
  end

  private

  def day_plan_params
    params.require(:day_plan).permit(:date, :day_id)
  end
end
