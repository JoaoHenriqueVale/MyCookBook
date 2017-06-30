Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :recipes, only: [:show,:new,:create, :edit, :update]
  resources :cuisines, only: [:show,:new,:create, :edit, :update]
  resources :recipe_types, only: [:show,:new,:create]
  post :search, to: 'home#search'
  get :all_recipes, to: 'home#all_recipes'
end
