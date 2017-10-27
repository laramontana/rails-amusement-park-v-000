Rails.application.routes.draw do

  root 'users#welcome'
  resources :users
  get 'signin' => 'sessions#new'
  post 'sessions' => 'sessions#create'

end
