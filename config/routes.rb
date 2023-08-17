Rails.application.routes.draw do
  root 'companies#example'

  post '/events/:id', to: 'events#buy_ticket'

  resources :tickets
  resources :companies, shallow: true do
    resources :events
  end

  get '*other', to: 'application#unknown'
end
