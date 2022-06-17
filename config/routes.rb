Rails.application.routes.draw do
 


  get 'contact',to:'contact#new'
  post 'contact',to:'contact#create'
  get 'contact/show'



  # get 'reviews/new'
  post 'mess/:id/review_post' ,to:'reviews#create',as:'review_post'
  get 'reviews/index'

  get 'messes/new'
  get 'messes/index'
  get 'messes/create'
  get 'messes/update'
  get 'messes/destroy'
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

  post 'signin?redirect=:url',to:'session#xyz',as:'signred'


  #owner routes
  get 'signup_owner',to:'users#mess_owner'
  post 'signup_owner',to:'users#mess_owner_create' 

  #mess create routes

  resources :messes,except:[:new,:create]
  get 'upload',to:'messes#new',as:'upload'
  post 'upload',to:'messes#create'

  #show phone number

  post 'shownumber/:id',to:'messes#show_number',as:'shownumber'

  #search action

  get 'search',to:'welcome#search'

  get 'advance',to:'welcome#show_adv_search'
  get 'advance_search',to:'welcome#advance_search'

  get 'checkpoint',to:'welcome#check_user_type'



  get 'about',to:'welcome#about'

 
end
