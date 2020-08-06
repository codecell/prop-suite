Rails.application.routes.draw do
  root 'apartments#index'
  
  devise_for :users
  resources :reviews
  resources :users, only: [:index, :show] do
    resources :reviews, only: [:create, :show, :index]
  end
  resources :searches, only: [:new, :create, :show]
  resources :apartments, only: [:new, :create, :show, :edit, :update, :destroy, :index]
  resources :followings, only: [:new,:index, :show, :create, :edit, :update, :destroy]
end
