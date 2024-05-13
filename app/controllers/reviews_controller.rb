class ReviewsController < ApplicationController

  # THE "NEW" IS NOT MOVED TO RESTAURANTS#SHOW
  # '/restaurants/22/reviews/new'
  # def new
  #   # BOTH for the form
  #   @review = Review.new
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  # end

  # post '/restaurants/22/reviews' (no view)
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
