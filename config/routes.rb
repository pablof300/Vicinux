Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: "sessions#create"

  delete 'logout', to: 'sessions#destroy'
  get 'dashboard', to: 'users#dashboard'
end
