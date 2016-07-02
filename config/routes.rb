Rails.application.routes.draw do
  namespace :admin do
    resource :dashboard, only: [:show]
    resources :families, only: [:show, :new, :create, :index, :update]
  end
#this will be namspaced underneath the charity
  resources :families, only: [:index, :show]

  resources :users, only: [:new, :create, :edit, :update]

  resources :cart, only: [:index]

  resources :cart_items, only: [:create, :update, :destroy]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get '/dashboard', to: "users#show"

  resources :donations, only: [:index, :show, :new, :create]

  resources :loans, only: [:show, :edit, :update, :new, :create]
  # resources :homes, only: [:show]

  root to: "homes#show"

  resources :charities, only: [:index, :edit]
  patch '/charities/:id', to: "charities#update"

  get ':charity_slug', to: 'charities#show', as: :charity

  namespace :charity, path: ':charity_slug', as: :charity do
    resources :families, only: [:index]
  end

  scope :category do
    get ':categories_slug', to: 'categories#show', as: :category
  end
end
