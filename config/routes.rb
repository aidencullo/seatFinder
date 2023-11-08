Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root 'api/v1/events#show', :id => 1

  post '/events/:id', to: 'events#buy_ticket'
  post '/tickets/test', to: 'tickets#test', as: 'buy_ticket'

  resources :tickets
  resources :spaces
  
  resources :companies, shallow: true do
    resources :events
  end

  namespace :api do
    namespace :v1 do
      resources :companies, shallow: true do
        resources :events, shallow: true do
          resources :tickets
          resources :spaces
        end
      end
    end
  end

  match '*path', to: 'application#not_found', via: :all
end
