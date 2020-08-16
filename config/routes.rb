Rails.application.routes.draw do
  root 'apartments#index'
  
  devise_for :users
  resources :reviews
  resources :users, only: [:index, :show] do
    resources :reviews, only: [:create, :show, :index]
  end
  resources :apartments
  resources :searches, only: [:new, :create, :show]
  resources :followings, only: [:new, :index, :show, :create]
end
