Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#app"
  resources :products, only: [:index, :create]
  get "/products/:category", to: "products#load"
  resources :shopping_lists, only: [:index, :create]
  resources :list_items, only: [:index, :create]
  patch "/list_items/buld_update", to: "list_items#bulk_update"
  post "/list_items/new", to: "list_items#create"

  # Log in (session related)
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: "logout"

  # Create user
  get "signup", to: "users#new", as: "signup"
  resources :users, only: [:create]
end
