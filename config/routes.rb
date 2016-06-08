Rails.application.routes.draw do
  resources :families, only: [:index, :show]

  resources :users, only: [:new, :create]

  resources :cart, only: [:create, :index]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get '/dashboard', to: "users#show"

  root to: "families#index"

  resources :categories, only: [:show], path: ""
end
