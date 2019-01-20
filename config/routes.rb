Rails.application.routes.draw do
  get 'catch_all/index'
  resources :messages
  resources :exchanges
  resources :requests
  resources :categories
  resources :items
  resources :communities
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  get 'pending', to: 'exchanges#pending'
  get 'current', to: 'exchanges#current'

  get 'etrade', to: 'exchanges#etrade'

  post 'login', to: "sessions#create"

  delete 'logout', to: 'sessions#destroy'
  get 'dashboard', to: 'users#dashboard'

  get '*path', to: 'catch_all#index'

  mount ActionCable.server, at: '/cable'
end
