Rails.application.routes.draw do
  root 'companies#example'

  get '/tickets/buy', to: 'tickets#buy', as: 'buy'

  resources :spaces, shallow: true do
    resources :tickets
  end
  
  resources :companies, shallow: true do
    resources :events
  end

  get '*other', to: 'application#unknown'
end
