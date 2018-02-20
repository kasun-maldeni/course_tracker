Rails.application.routes.draw do
  root 'dashboard#index'
  get '/warmups', to: 'dashboard#warmups', as: 'warmups'
  get '/homework', to: 'dashboard#homework', as: 'homework'
  get '/task_progress/:user_group_task_id', to: 'dashboard#task_progress', as: 'task_progress'

  get '/sign_up/:uuid', to: 'users#sign_up'
  patch '/sign_up/:uuid', to: 'users#first_update'

  resource :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
end
