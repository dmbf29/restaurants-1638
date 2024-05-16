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
      json_sent_to_js_controller = {
        form: render_to_string(partial: "reviews/form", locals: { review: Review.new, restaurant: @restaurant }, formats: [:html]),
        review: render_to_string(partial: "reviews/review", locals: { review: @review }, formats: [:html])
      }
      respond_to do |format|
        format.html { redirect_to restaurant_path(@restaurant) }
        format.json { render json: json_sent_to_js_controller, status: :created }
      end
    else
      # only send the form if the review didn't save
      json_sent_to_js_controller = {
        form: render_to_string(partial: "reviews/form", locals: { review: @review, restaurant: @restaurant }, formats: [:html])
      }
      respond_to do |format|
        format.html { render 'restaurants/show', status: :unprocessable_entity }
        format.json { render json: json_sent_to_js_controller, status: :created }
      end
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
