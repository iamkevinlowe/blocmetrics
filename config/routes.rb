Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show]
  resources :registered_applications
  root to: 'welcome#index'
end
