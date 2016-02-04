Rails.application.routes.draw do
  resources :sessions, only: :create
  resources :users, only: :create

  get 'about', to: 'pages#about'

  root to: 'pages#home'
end
