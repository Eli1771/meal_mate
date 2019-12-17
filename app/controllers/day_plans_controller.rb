class DayPlansController < ApplicationController
  def show
    day = DayPlan.find_by(slug: params[:slug])
    render json: DayPlanSerializer.new(day).to_serialized_json
  end

  def new
  end

  def create
    day = DayPlan.create(day_plan_params)
    render json: day
  end

  def destroy
    day = DayPlan.find_by(slug: params[:slug])
    day.delete
    render json: day
  end

  private

  def day_plan_params
    params.require(:day_plan).permit(:date, :day_id, :week_plan_id, :slug)
  end
end
