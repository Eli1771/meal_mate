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
    render json: day
  end

  private

  def day_plan_params
    params.require(:day_plan).permit(:date, :breakfast, :lunch, :dinner)
  end
end
