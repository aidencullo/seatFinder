Rails.application.routes.draw do
  root 'companies#example'

  get '/tickets/buy', to: 'tickets#buy', as: 'buy'

  resources :tickets
  resources :spaces
  
  resources :companies, shallow: true do
    resources :events
  end

  get '*other', to: 'application#unknown'
end
