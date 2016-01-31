Rails.application.routes.draw do
  resources :users, only: [:create]

  get 'about', to: 'pages#about'

  root to: 'pages#home'
end
