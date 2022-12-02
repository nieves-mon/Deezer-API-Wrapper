Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :chart do
    resources :top_albums, only: [:index]
    resources :top_tracks, only: [:index]
    resources :top_artists, only: [:index]
    resources :top_playlists, only: [:index]
    resources :top_podcasts, only: [:index]
  end

  resources :albums, only: [:show]
  resources :tracks, only: [:show]
end
