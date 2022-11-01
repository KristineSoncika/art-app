Rails.application.routes.draw do
  root to: 'artworks#index'

  resources :artworks do
    get '/page/:page', action: :index, on: :collection
  end
  # resources :reviews, only: [:create, :destroy]
  # get '*path', to: 'home#index', via: :all
end
