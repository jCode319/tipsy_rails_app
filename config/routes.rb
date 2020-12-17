Rails.application.routes.draw do

  root 'sessions#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #omniauth callback
  get '/auth/google_oauth2/callback', to: 'sessions#google_auth'

  resources :favs
  resources :reviews
  resources :cocktail_bars
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
