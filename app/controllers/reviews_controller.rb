class ReviewsController < ApplicationController
  def create
      @listing = Listing.find(params[:listing_id])
      @user = User.find(params[:user_id])
      @review = @listing.reviews.new(review_params)

      @photo = Photo.new
      @reservations = @listing.reservations
      @reservation = Reservation.new
      @tags = @listing.tags
      @amenities = Amenity.all - @listing.amenities

    if @review.save
      flash[:notice] = "Your review has been saved!"
      redirect_to :back
    else
      @reviews = @listing.reviews[0...-1]
      flash[:alert] = "There was a problem creating your review"
      render 'listings/show'
    end
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      flash[:notice] = "Your review has been updated"
      redirect_to :back
    else
      flash[:alert] = "There was a problem updating your review"
      render 'listings/show'
    end
  end

  private
    def review_params
      params.permit(:user_id, :rating, :description, :commentable_id, :commentable_type)
    end
end
