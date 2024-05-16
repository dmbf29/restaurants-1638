Rails.application.routes.draw do
  devise_for :users
  root to: 'restaurants#index'
  resources :restaurants do
    # CRUD routes
    resources :reviews, only: [:create]
    # Non-CRUD routes
    collection do
      get :top
    end
    member do
      get :chef
    end
  end
  resources :reviews, only: [:destroy]
  # get '/restaurants/top', to: 'restaurants#top', as: :top_restaurants
  # get '/restaurants/:id/chef', to: 'restaurants#chef', as: :chef_restaurant

end

# Non-CRUD Routes
# collection -> about all restaurants (aka no ID)
# member     -> about a specific restaurant (aka need an ID)
