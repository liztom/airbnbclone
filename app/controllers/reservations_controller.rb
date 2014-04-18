class ReservationsController < ApplicationController
  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = @listing.reservations.new(reservation_params)
    @tags = @listing.tags
    @user = @listing.user

    if @reservation.save
      CustomMailer.reservation_made(@user, @reservation.user).deliver
      flash[:notice] = "Your reservation was made"
      redirect_to user_listing_path(@user, @listing)
    else
      @reservations = @listing.reservations[0...-1]
      flash[:alert] = "There was an error with your reservation."
      render 'listings/show'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to root_path
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update(reservation_params)
      redirect_to :back
    else
      render 'listings/show'
    end
  end

private
  def reservation_params
    params.require(:reservation).permit(:user_id, :checkin, :checkout)
  end
end
