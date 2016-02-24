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
        member do
          get '/items',     to: 'merchants/items#index'
          get '/invoices',  to: 'merchants/invoices#index'
        end
      end
      resources :items,         only: [:index, :show], defaults: {format: :json} do
        collection do
          get '/find',      to: 'items#show'
          get '/random',    to: 'items#show'
          get '/find_all',  to: 'items#index'
        end
      end
      resources :invoices,      only: [:index, :show], defaults: {format: :json} do
        collection do
          get '/find',      to: 'invoices#show'
          get '/random',    to: 'invoices#show'
          get '/find_all',  to: 'invoices#index'
        end
        member do
          get '/transactions', to: 'invoices/transactions#index'
        end
      end
      resources :invoice_items, only: [:index, :show], defaults: {format: :json} do
        collection do
          get '/find',      to: 'invoice_items#show'
          get '/random',    to: 'invoice_items#show'
          get '/find_all',  to: 'invoice_items#index'
        end
      end
      resources :transactions,  only: [:index, :show], defaults: {format: :json} do
        collection do
          get '/find',      to: 'transactions#show'
          get '/random',    to: 'transactions#show'
          get '/find_all',  to: 'transactions#index'
        end
      end
    end
  end

end
