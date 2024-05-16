class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :top, :chef]

  # '/restaurants/top'
  def top
    @restaurants = Restaurant.where(rating: 5)
  end

  # '/restaurants/1/chef'
  def chef
    @restaurant = Restaurant.find(params[:id])
  end

  # '/restaurants'
  def index
    @restaurants = Restaurant.all
    # render 'index.html.erb'
  end

  # '/restaurants/1'
  def show
    @restaurant = Restaurant.find(params[:id])
    # this is for the form
    @review = Review.new
    # render 'show.html.erb'
  end

  # '/restaurants/new'
  def new
    # this instance variable is JUST for the form
    @restaurant = Restaurant.new
  end

  # we cant access from a URL. The form is sending the data here (/restaurants)
  # THIS DOES NOT HAVE A VIEW
  def create
    # we need to create our instance with our STRONG params
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      # show the form with the restaurant that didnt save (not a brand new one)
      render 'new', status: :unprocessable_entity
    end
  end

  # '/restaurants/1/edit'
  def edit
    # this instance variable is JUST for the form
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    # load the the instacne i want to update
    @restaurant = Restaurant.find(params[:id])
    # update the instance with the strong_params
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  # we cant access this one in the URL, but a link can with a delete method
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    # we are whitelisting the attributes a user can give us
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end
