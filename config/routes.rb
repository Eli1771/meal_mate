Rails.application.routes.draw do
  resources :migrations
  resources :recipe_plans, only: [:new, :create]
  resources :meals, only: [:show] do
    resources :recipes, only: [:index, :show]
  end
  resources :week_plans, only: [:new, :create, :show], param: :slug
  resources :day_plans, only: [:new, :create, :show], param: :slug
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
