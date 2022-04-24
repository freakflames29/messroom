Rails.application.routes.draw do
  get 'random/new'
  post 'find', to:'random#find'
  root 'welcome#index'
 
end
