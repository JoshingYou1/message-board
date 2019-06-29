Rails.application.routes.draw do
  root 'home#show'
  resources :posts
  resources :users, only: [:index, :create, :edit, :show, :update, :destroy, :new]
 
  # get 'register', to: 'users#new', as: 'register'
  get 'login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/dashboard', to: 'dashboard#show', as: 'dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end