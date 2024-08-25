Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  root to: 'home#index'
  get "/categories/:id", to: "categories#show"
  get "/products/:id", to: "products#show"
end
