Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only:  [:index, :show, :create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :cities, only: [:index]
      resources :neighbourhoods, only: [:index]
      resources :listings, only: [:index, :create]
      resources :reservations, only: [:index, :create]
      resources :reviews, only: [:index, :create]
    end
  end
end
