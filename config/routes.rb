Project2::Application.routes.draw do


  root to: 'auctions#index'
  resources :users
  resources :bids
  resources :categories
  resources :auctions
  resources :messages



get '/auth/:facebook/callback', to: 'sessions#create'

end
