Rails.application.routes.draw do
  resources :tickets
  resources :events
  resources :venues
  resources :companies
  resources :customers
  root 'movies#index'
  
  # get 'home', to: 'pages#home'
  get 'home', to: 'movies#index'

  delete 'movies', to: 'movies#destroy_all'

  resources :movies
  resources :showings
  
  get '*other', to: 'application#unknown'
end
