Project2::Application.routes.draw do

  root to: 'auctions#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'auctions#index'
  get '/logout', to: 'sessions#destroy'

  resources :users do
    resources :messages
  end

  resources :categories, only: [:index]

  resources :auctions do
    post '/auctions/:id/accept_badge', to: 'auctions#accept_badge', as: :accept_badge
    resources :bids
    post '/bids/:id/add_comment', to: 'bids#accept_bid',as: :accept_bid
  end

end
