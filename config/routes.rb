Rails.application.routes.draw do
  resources :recipe_plans
  resources :meals
  resources :days
  resources :week_plans
  resources :day_plans, param: :slug
  resources :recipe_ingredients
  resources :ingredients
  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
