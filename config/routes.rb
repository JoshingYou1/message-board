Rails.application.routes.draw do
  root 'home#show'
  resources :messages
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
