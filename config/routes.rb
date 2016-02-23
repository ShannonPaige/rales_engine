Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :customers,     only: [:index, :show], defaults: {format: :json} do
        collection do
          get '/find',      to: 'customers#show'
          get '/random',    to: 'customers#show'
          get '/find_all',  to: 'customers#index'
        end
      end
      resources :merchants,     only: [:index, :show], defaults: {format: :json} do
        collection do
          get '/find',      to: 'merchants#show'
          get '/random',    to: 'merchants#show'
          get '/find_all',  to: 'merchants#index'
        end
      end
      resources :items,         only: [:index, :show], defaults: {format: :json} do
        collection do
          get '/find',      to: 'items#show'
          get '/random',    to: 'items#show'
          get '/find_all',  to: 'items#index'
        end
      end
      resources :invoices,      only: [:index, :show], defaults: {format: :json}
      resources :invoice_items, only: [:index, :show], defaults: {format: :json}
      resources :transactions,  only: [:index, :show], defaults: {format: :json}
    end
  end

end
