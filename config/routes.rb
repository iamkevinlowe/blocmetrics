Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show]
  resources :registered_applications
  root to: 'welcome#index'

  namespace :api, defaults: { format: :json } do
    match 'events', to: 'events#index', via: [:options]
    resources :events, only: [:create]
  end
end
