Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do

      resources :users, only: [:create, :show]
      post '/login', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      get '/users', to: 'users#index'
      get '/profile', to: 'users#profile'

      resources :artists, only: [:index, :show]
      resources :locations, only: [:index, :show]
      resources :playlists, only: [:index, :show]
      resources :songs, only: [:index, :show]
      resources :user_playlists, only: [:index, :create]
      resources :webplayers
      resources :messages, only: [:create]
      mount ActionCable.server => '/cable'

    end
  end
end
