Bearbnb::Application.routes.draw do
  devise_for :users

  resources :users do
    resources :listings do
      resources :reservations
      resources :photos
    end
  end

  resources :reviews
  resources :calendars, :only => [:create]

  resources :amenities do
    resources :tags
  end
  root to: 'listings#index'
end
