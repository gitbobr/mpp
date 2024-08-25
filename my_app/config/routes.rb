Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  root to: 'home#index'
  get "/categories/:id", to: "categories#show"
  get "/products/:id", to: "products#show"
  get '/orders', to: 'orders#index'
  post '/orders/add_to_cart', to: 'orders#add_to_cart', as: 'add_to_cart'
  delete '/orders/:id', to: 'orders#destroy'
  post '/orders/update_quantity/:id', to: 'orders#update_quantity', as: 'update_quantity'
  post '/orders/checkout', to: 'orders#checkout', as: 'checkout'
  get '/profile', to: 'profile#index'
end
