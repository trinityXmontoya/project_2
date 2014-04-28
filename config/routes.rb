Project2::Application.routes.draw do

  root to: 'auctions#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'auctions#index'

  resources :users
  resources :messages
  resources :bids
  resources :auctions
end
