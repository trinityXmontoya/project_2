Project2::Application.routes.draw do
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 41846627a73503e846be951c1913e8d1da5e721c

  root to: 'auctions#index'
  resources :users
  resources :bids
  resources :categories
  resources :auctions
  resources :messages
<<<<<<< HEAD
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
=======
  get "messages/index"
  get "messages/show"
  get "messages/new"
  get "messages/edit"
  get "categories/index"
  get "categories/show"
  get "categories/new"
  get "categories/edit"
  get "bids/index"
  get "bids/show"
  get "bids/new"
  get "bids/edit"
  get "auctions/index"
  get "auctions/show"
  get "auctions/new"
  get "auctions/edit"
  get "users/index"
  get "users/show"
  get "users/new"
  get "users/edit"
>>>>>>> 9b32de2c71e8d3bc2fec99cbf3e288449c298fa6
=======
>>>>>>> 41846627a73503e846be951c1913e8d1da5e721c



get '/auth/:facebook/callback', to: 'sessions#create'

end
