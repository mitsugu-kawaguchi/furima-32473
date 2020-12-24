Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  devise_for :users
  root to: 'items#index'
  resources :items do
   resources :comments, only: :create
   resources :purchases, only:[:index, :create]
  end
  resources :users, only:[:show, :update]
  resources :cards, only: [:new, :create]
end
