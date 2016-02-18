Rails.application.routes.draw do
  resource :map, only: :show

  resources :locations, only: [:new, :create]
  resources :sessions, only: [:create, :destroy]
  resources :users, only: :create
  resources :worlds, only: [:show, :new, :create]

  get 'about', to: 'pages#about'

  constraints -> (request) { request.session[:user_id].present? } do
    root to: 'worlds#new', as: :authenticated_root
  end
  root to: 'pages#home'
end
