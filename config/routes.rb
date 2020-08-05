Rails.application.routes.draw do
  root 'apartments#index'
  
  devise_for :users
  resources :searches, only: [:new, :create, :show]
  resources :users, only: [:index, :show]
  resources :apartments, only: [:new, :create, :show, :edit, :update, :destroy, :index]
  resources :followings, only: [:new,:index, :show, :create, :edit, :update, :destroy]
end
