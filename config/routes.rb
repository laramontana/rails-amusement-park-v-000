Rails.application.routes.draw do

  root 'users#welcome'

  get 'signin' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  resources :users do
    resources :attractions
  end
  resources :attractions
  post 'rides/new' => 'rides#new'



end
