Bearbnb::Application.routes.draw do
  devise_for :users
  resources :users do
    resources :listings
  end
  root to: 'listings#index'
end
