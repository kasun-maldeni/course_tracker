Rails.application.routes.draw do
  root 'dashboard#index'
  resource :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
end
