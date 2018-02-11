Rails.application.routes.draw do
  root 'dashboard#index'

  get '/sign_up/:uuid', to: 'users#sign_up'
  put '/sign_up/:uuid', to: 'users#first_update'

  resource :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
end
