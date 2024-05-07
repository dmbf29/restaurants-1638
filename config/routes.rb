Rails.application.routes.draw do
  # http_verb '/path', to: 'controller#action', as: :prefix
  # the prefix is only connected to the path


  # CRUD
  # Read all
  get '/restaurants', to: 'restaurants#index', as: :restaurants

  # Create
  # One page for JUST the form
  get '/restaurants/new', to: 'restaurants#new', as: :new_restaurant
  # Another action to create the instance from the form data
  post '/restaurants', to: 'restaurants#create'

  # Read one
  get '/restaurants/:id', to: 'restaurants#show', as: :restaurant

  # Update
  # One page for JUST the form
  get '/restaurants/:id/edit', to: 'restaurants#edit', as: :edit_restaurant
  # Another action to update the instance from the form data
  patch '/restaurants/:id', to: 'restaurants#update'

  # Delete
  delete '/restaurants/:id', to: 'restaurants#destroy'
end


# See all restaurants -> index - restaurants_path
# See details about one restaurant -> show
# Create a restaurant
# Update a restaurant
# Destroy a restaurant
