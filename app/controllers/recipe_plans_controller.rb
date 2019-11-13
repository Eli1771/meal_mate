class RecipePlansController < ApplicationController
  def create
    recipe_plan = RecipePlan.create(recipe_plan_params)
    render json: recipe_plan
  end

  private

  def recipe_plan_params
    params.require(:recipe_plan).permit(:recipe_id, :day_plan_id)
  end
end
