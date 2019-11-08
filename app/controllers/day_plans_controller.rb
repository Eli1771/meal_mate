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
    render json: day.to_json(:include => {
      :breakfast_recipe => {:only => [:name, :instructions]}
    }, :except => [:created_at, :updated_at])
  end

  private

  def day_plan_params
    params.require(:day_plan).permit(:date, :breakfast, :lunch, :dinner)
  end
end

# def show
#   sighting = Sighting.find_by(id: params[:id])
#   render json: sighting.to_json(:include => {
#     :bird => {:only => [:name, :species]},
#     :location => {:only => [:latitude, :longitude]}
#   }, :except => [:updated_at])
# end
