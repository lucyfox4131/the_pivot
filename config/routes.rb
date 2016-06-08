Rails.application.routes.draw do
  resources :families, only: [:index, :show]

  resources :cart, only: [:create, :index]


  resources :categories, only: [:show], path: ""

  root to: "families#index"
end
