Rails.application.routes.draw do
  root 'dashboard#index'
  get '/warmups', to: 'dashboard#warmups', as: 'warmups'
  get '/homework', to: 'dashboard#homework', as: 'homework'

  get '/sign_up/:uuid', to: 'users#sign_up'
  patch '/sign_up/:uuid', to: 'users#first_update'

  resource :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
end
