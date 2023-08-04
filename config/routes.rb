Rails.application.routes.draw do
  root 'movies#index'
  
  # get 'home', to: 'pages#home'
  get 'home', to: 'movies#index'
  get 'admin', to: 'application#admin'

  delete 'movies', to: 'movies#destroy_all'

  resources :movies
  resources :showings
  
  get '*other', to: 'application#unknown'
end
