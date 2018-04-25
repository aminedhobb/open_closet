Rails.application.routes.draw do
  resources :products do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :orders, only: [:index, :show, :edit, :update, :create]
  resources :reviews, only: [:edit, :update, :destroy]
  devise_for :users
  root to: 'pages#home'
end
