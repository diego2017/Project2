Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#app"
  resources :products, only: [:index, :create]
  get "/products/:category", to: "products#load"
end
