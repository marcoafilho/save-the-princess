Rails.application.routes.draw do
  constraints -> (request) { request.session[:account_id].present? } do
    root to: 'worlds#new', as: :authenticated_root
  end
  root to: 'pages#home'
  get 'about', to: 'pages#about'

  resource :session, only: %i(create destroy)
  resource :map, only: :show

  resources :accounts, only: %i(edit create update)
  resources :worlds do
    resources :locations, only: :new
  end
  resources :locations, only: :create

  scope '(:username)', as: :account do
    resources :worlds
  end
end
