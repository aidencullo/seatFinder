Rails.application.routes.draw do
  root 'pages#home'
  
  get '*other', to: 'application#unknown'
end
