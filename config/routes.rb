Rails.application.routes.draw do
 


  resources :users,except:[:new]
  get 'signup',to:'users#new'
  # resources :pins
  # get 'random/new'
  # post 'find', to:'random#find'
  root 'welcome#index'

  #login or session routes
  get 'signin',to:'session#new'
  post 'signin',to:'session#create'
  delete 'signout',to:'session#destroy'


  #owner routes
  get 'signup_owner',to:'users#mess_owner'
  post 'signup_owner',to:'users#mess_owner_create' 

 
end
