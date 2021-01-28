Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do
    post "sign_up", to: "registrations#create"
    post "sign_in", to: "sessions#create"
  end
  
  resources :quotes do
    match '/scrape', to: 'quotes#scrape', via: :post, on: :collection
    match '/:tags', to: 'quotes#search', via: :get, on: :collection
  end

  root to: 'quote#index'
end
