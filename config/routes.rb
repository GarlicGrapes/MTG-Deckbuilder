Rails.application.routes.draw do

  get '*path',
      to: 'fallback#index',
      constraints: ->(req) { !req.xhr? && req.format.html? }


  resources :users, only: [:show, :create]
  resources :decks, only: [:index, :show]
  resources :cards
  resources :deck_cards
  resources :sessions, only: [:create, :destroy]

  get '/decks', to: "decks#index"
  post '/signup', to: "users#create"
  post '/login', to: "sessions#create"
  get '/auth', to: "users#show"
  # get '/me', to: "users#show"
  delete '/logout', to: "sessions#destroy"
end