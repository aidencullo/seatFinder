Rails.application.routes.draw do
  root 'companies#example'

  post '/events/:id', to: 'events#buy_ticket'
  post '/tickets/test', to: 'tickets#test', as: 'buy_ticket'

  resources :tickets
  
  resources :companies, shallow: true do
    resources :events
  end

  get '*other', to: 'application#unknown'
end
