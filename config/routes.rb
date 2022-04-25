Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/create'
  # get 'users/new'
  # get 'users/update'
  # get 'users/edit'

  resources :users
  # resources :pins
  # get 'random/new'
  # post 'find', to:'random#find'
  root 'welcome#index'
 
end
