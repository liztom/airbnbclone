Bearbnb::Application.routes.draw do
  devise_for :users
  resources :users do
    resources :listings do
      resources :photos
    end
  end

  resources :amenities do
    resources :tags
  end
  root to: 'users#index'
end
