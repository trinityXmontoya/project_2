Project2::Application.routes.draw do

get '/auth/:facebook/callback', to: 'sessions#create'

end
