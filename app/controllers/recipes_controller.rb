class RecipesController < ApplicationController
  def index
    # binding.pry
    if params[:meal_id]
      recipes = Meal.find(params[:meal_id]).recipes
    else
      recipes = Recipe.all
    end
    render json: recipes
  end

  def show
    if params[:meal_id]
      recipes = Meal.find(params[:meal_id]).recipes
      recipe = recipes[params[:id].to_i]
    else
      recipe = Recipe.find_by(id: params[:id])
    end
    render json: recipe
  end
end
