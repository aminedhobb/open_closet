Rails.application.routes.draw do
  resources :products do
    resources :orders, only: [:new, :create] do
      resources :payments, only: [:new,:create]
    end
    resources :reviews, only: [:index, :new, :create]
  end
  resources :orders, only: [:index, :show, :edit, :update]
  resources :reviews, only: [:edit, :update, :destroy]
  devise_for :users
  root to: 'pages#home'
end
