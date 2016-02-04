Rails.application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  resources :users, only: :create

  get 'about', to: 'pages#about'

  root to: 'pages#home'
end
