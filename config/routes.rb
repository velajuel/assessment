Rails.application.routes.draw do
  resources :patients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"
  
  get "/welcome" => "welcome#index", as: "welcome"

 	resources :doctors do 
 	resources :bookings, only: [:new, :create]
  # get "/bookings/new" => "bookings#new"

  # post "/bookings" => "bookings#create"
end

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  
  get "/confirmation" => "confirmation#new"

  get "/search" => "welcome#search"

  get "/logout" => "sessions#logout", as: "logout"
end
