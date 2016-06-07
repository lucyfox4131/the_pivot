Rails.application.routes.draw do
  resources :families, only: [:index]

  resources :categories, only: [:show]

  root to: "families#index"
end
