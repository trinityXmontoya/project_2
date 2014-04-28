Project2::Application.routes.draw do
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



get '/auth/:facebook/callback', to: 'sessions#create'

end
