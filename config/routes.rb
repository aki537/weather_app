Rails.application.routes.draw do
  root to: 'toppages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users

  resources :comments, only: [:create, :destroy]
  resources :goods, only: [:create, :destroy]
  resources :bads, only: [:create, :destroy]
end

