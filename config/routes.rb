Rails.application.routes.draw do
  devise_for :users
  
  root to: "items#index"
  resources :items do
    get 'items/search'
    resources :orders, only: [:index, :create]
  end
  resources :users, only: [:show, :edit, :update]
  resources :admin, only: [:index, :show]
  resources :purchases, only: :show
  resources :comments, only: [:index, :new, :show, :create]
  resources :services do
  resources :service_orders, only: [:index, :new, :create]
  end
end