Rails.application.routes.draw do
  root 'dashboard#index'
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
end
