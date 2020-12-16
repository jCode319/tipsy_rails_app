Rails.application.routes.draw do

  root 'sessions#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'


  resources :favs
  resources :reviews
  resources :cocktail_bars
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
