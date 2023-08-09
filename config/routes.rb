Rails.application.routes.draw do
  root 'companies#example'

  resources :companies
  resources :events

  resources :companies do
    resources :events
  end

  get '*other', to: 'application#unknown'
end
