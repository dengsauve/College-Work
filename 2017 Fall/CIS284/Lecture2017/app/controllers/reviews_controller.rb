class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # POST /reviews
  # POST /reviews.json
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create( review_params )
    @review.save

    redirect_to restaurant_path( @restaurant.id )
  end


  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @restaurant = Restaurant.find( params[:restaurant_id] )
    @review = @restaurant.reviews.find( params[:id])
    @review.destroy

    redirect_to restaurant_path( @restaurant.id )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:name, :review_text, :rating, :restaurant_id)
    end
end
