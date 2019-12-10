Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    collection do
      get "search"
    end
  end

  resources :images, only: [:destroy]
  resources :users, only: [:index, :show, :new, :update, :edit] do
    collection do
      get "new1", to: "users#new1"
      get "new2", to: "users#new2"
      get "new3", to: "users#new3"
      get "new4", to: "users#new4"
      get "new5", to: "users#new5"
      get "logout", to: "users#logout"
      get "payment"
      get "identification"
    end
    member do
      get "listing"
      get "profile"
    end
  end
  resources :categories, only: [:index, :show]
  resources :brands, only: [:index, :show]

end
