Rails.application.routes.draw do

  root 'searches#home'
  resources :searches

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #omniauth callback
  get '/auth/google_oauth2/callback', to: 'sessions#google_auth'

    resources :users  do
      resource :reviews, only: [:new, :create, :index, :show]
    end

    resources :cocktail_bars  do
      resource :favs
    end

    resources :cocktail_bars  do
      resource :reviews, only: [:new, :create, :index]
    end

  resources :favs
  resources :reviews
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
