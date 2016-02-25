Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :customers,     only: [:index, :show], defaults: {format: :json} do
        collection do
          get '/find',      to: 'customers#show'
          get '/random',    to: 'customers#show'
          get '/find_all',  to: 'customers#index'
        end
        member do
          get '/invoices',     to: 'customers/invoices#index'
          get '/transactions', to: 'customers/transactions#index'
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
          get '/revenue',   to: 'merchants/revenues#show'
        end
      end

      resources :items,         only: [:index, :show], defaults: {format: :json} do
        collection do
          get '/find',      to: 'items#show'
          get '/random',    to: 'items#show'
          get '/find_all',  to: 'items#index'
        end
        member do
          get '/invoice_items',  to: 'items/invoice_items#index'
          get '/merchant',       to: 'items/merchants#show'
        end
      end

      resources :invoices,      only: [:index, :show], defaults: {format: :json} do
        collection do
          get '/find',          to: 'invoices#show'
          get '/random',        to: 'invoices#show'
          get '/find_all',      to: 'invoices#index'
        end
        member do
          get '/transactions',  to: 'invoices/transactions#index'
          get '/invoice_items', to: 'invoices/invoice_items#index'
          get '/items',         to: 'invoices/items#index'
          get '/customer',      to: 'invoices/customers#show'
          get '/merchant',      to: 'invoices/merchants#show'
        end
      end

      resources :invoice_items, only: [:index, :show], defaults: {format: :json} do
        collection do
          get '/find',      to: 'invoice_items#show'
          get '/random',    to: 'invoice_items#show'
          get '/find_all',  to: 'invoice_items#index'
        end
        member do
          get '/invoice',  to: 'invoice_items/invoices#show'
          get '/item',     to: 'invoice_items/items#show'
        end
      end

      resources :transactions,  only: [:index, :show], defaults: {format: :json} do
        collection do
          get '/find',      to: 'transactions#show'
          get '/random',    to: 'transactions#show'
          get '/find_all',  to: 'transactions#index'
        end
        member do
          get '/invoice',  to: 'transactions/invoices#show'
        end
      end

    end
  end

end
