Rails.application.routes.draw do
  resources :families, only: [:index]

  resources :categories, only: [:show], path: ""

  root to: "families#index"
end
