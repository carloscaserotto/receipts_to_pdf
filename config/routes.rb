Rails.application.routes.draw do
  root to: 'invoices#index'

  resources :invoices, :invoice_items, :articles
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
