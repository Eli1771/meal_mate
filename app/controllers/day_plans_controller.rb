require 'pry'

class DayPlansController < ApplicationController
  def show
    # binding.pry
    day = DayPlan.find_by(slug: params[:slug])
    render json: day
  end

  def new
  end

  def create
    # binding.pry
    day = DayPlan.create(day_plan_params)
    # render json: DayPlanSerializer.new(day).to_serialized_json
    render json: day
  end

  private

  def day_plan_params
    params.require(:day_plan).permit(:date, :day_id, :week_plan_id, :slug)
  end
end
