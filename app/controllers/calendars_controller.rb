class CalendarsController < ApplicationController

  def create
    @month = params[:month]
    @year = params[:year].to_i

    # breaker
    @user = User.find(params[:user_id])
    @listing = Listing.find(params[:listing_id])
    @reservations = @listing.reservations

    respond_to do |format|
      format.html { redirect_to redirect_to user_listing_path(@user, @listing) }
      format.js
    end

  end

end
