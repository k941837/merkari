Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    collection do
      get "search"
    end
  end

  resources :images, only: [:destroy]

  resources :users
  resources :categories, only: [:index, :show]
  resources :brands, only: [:index, :show]

end
