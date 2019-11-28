Rails.application.routes.draw do
  resources :migrations
  resources :recipe_plans
  resources :meals, only: [:show] do
    resources :recipes, only: [:index, :show]
  end
  resources :days
  resources :week_plans, param: :slug
  resources :day_plans, param: :slug
  resources :recipe_ingredients
  resources :ingredients
  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
