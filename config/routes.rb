Rails.application.routes.draw do
  root 'propertys#index'
  
  devise_for :users
  resources :propertys
end
