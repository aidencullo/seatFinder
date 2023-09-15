Rails.application.routes.draw do
  root 'companies#example'

  post '/events/:id', to: 'events#buy_ticket'
  post '/tickets/test', to: 'tickets#test', as: 'buy_ticket'

  resources :tickets
  resources :spaces
  
  resources :companies, shallow: true do
    resources :events
  end

  scope :api do
    scope :v1 do
      resources :events
      resources :tickets
    end
  end

  match '*path', to: 'application#not_found', via: :all
  # match '*path', to: ->(env) { [404, {}, ['Not Found']] }, via: :all
end
