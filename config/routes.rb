Rails.application.routes.draw do
  resources :week_plans
  resources :day_plans
  resources :recipe_ingredients
  resources :ingredients
  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
