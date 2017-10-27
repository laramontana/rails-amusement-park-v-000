Rails.application.routes.draw do

  root 'users#welcome'
  resources :users, :sessions


end
