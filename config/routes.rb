Rails.application.routes.draw do
  resources :families, only: [:index, :show]

  resources :categories, only: [:show], path: ""

  root to: "families#index"
end
