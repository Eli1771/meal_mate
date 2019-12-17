class RecipesController < ApplicationController
  def index
    if params[:meal_id]
      recipes = Recipe.meal(params[:meal_id])
    else
      recipes = Recipe.all
    end
    render json: recipes
  end

  def show
    if params[:meal_id]
      recipes = Recipe.meal(params[:meal_id])
      recipe = recipes[params[:id].to_i]
    else
      recipe = Recipe.find_by(id: params[:id])
    end
    render json: recipe
  end
end
