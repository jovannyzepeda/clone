Rails.application.routes.draw do
  root "users#login"
  use_doorkeeper
  resources :courses
  resources :users

  #rutas de api
  namespace :api, defaults: { format: "json" } do
  	resources :courses, controller: :courses, only: [:index]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
