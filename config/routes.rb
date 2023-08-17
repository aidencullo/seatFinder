Rails.application.routes.draw do
  root 'companies#example'

  post '/events/:id', to: 'events#test'

resources :companies, shallow: true do
    resources :events
  end

  get '*other', to: 'application#unknown'
end
