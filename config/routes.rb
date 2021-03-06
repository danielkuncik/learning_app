Rails.application.routes.draw do

  get 'quizes/new'

  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  
  get '/login', to: 'sessions#new'
  post '/login', to:  'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :quizes
  
end
