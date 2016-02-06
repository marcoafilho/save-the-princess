Rails.application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  resources :users, only: :create
  resources :worlds, only: [:new, :create]

  get 'about', to: 'pages#about'

  constraints -> (request) { request.session[:user_id].present? } do
    root to: 'worlds#new', as: :authenticated_root_path
  end
  root to: 'pages#home'
end
