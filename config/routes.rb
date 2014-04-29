Project2::Application.routes.draw do


  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'auctions#index'

  resources :users do
    resources :messages
  end

  resources :bids
  resources :categories
  resources :auctions

end
