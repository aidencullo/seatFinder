Rails.application.routes.draw do
  root 'pages#home'
  resources :events
  
  get '*other', to: 'application#unknown'
end
