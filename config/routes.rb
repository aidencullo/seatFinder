Rails.application.routes.draw do
  resources :comments
  resources :posts
  root 'movies#index'

  get 'home', to: 'pages#home'

  delete 'movies', to: 'movies#destroy_all'

  resources :movies
  resources :showings
  
  get '*other', to: 'application#unknown'
end
