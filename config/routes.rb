Rails.application.routes.draw do
  root 'companies#example'

  resources :companies, shallow: true do
    resources :events
  end
  
  get '*other', to: 'application#unknown'
end
