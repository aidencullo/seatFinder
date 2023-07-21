Rails.application.routes.draw do
  root 'movies#index'

  get 'home', to: 'pages#home' , as: 'nickname'

  delete 'movies', to: 'movies#destroy_all'
  get 'nothing', to: 'movies#print'

  resources :movies do
    resources :showings
  end
  
  get '*other', to: 'application#unknown'
end
