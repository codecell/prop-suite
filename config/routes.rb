Rails.application.routes.draw do
  root 'apartments#index'
  
  devise_for :users
  resources :users, only: [:index, :show]
  resources :apartments
end
