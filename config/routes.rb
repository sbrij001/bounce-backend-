Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :artists, only: [:index, :show]
      resources :locations, only: [:index, :show]
      resources :playlists, only: [:index, :show]
      resources :songs, only: [:index, :show]

      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
