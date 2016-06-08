Rails.application.routes.draw do
  resources :families, only: [:index]

  resources :categories, only: [:show], path: ""

  resources :users, only: [:new, :create]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  root to: "families#index"
end
