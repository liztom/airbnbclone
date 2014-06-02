class ListingsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    if params[:search].nil?
      @listings = Listing.all
    else
      @listings = Listing.search_by_city(params[:search])
      if @listings.length < 1
        flash[:alert] = "No results found"
      end
    end
  end

  def new
    @listing = Listing.new
  end

  def show
    @listing = Listing.find(params[:id])
    @photo = Photo.new
    @user = User.find(params[:user_id])
    @reservations = @listing.reservations
    @reservation = Reservation.new
    @tags = @listing.tags
    @review = Review.new
    @reviews = @listing.reviews
    @amenities = Amenity.all - @listing.amenities
  end

  def create
    @user = User.find(params[:user_id])
    @listing = Listing.new(listing_params)
    @user.listings << @listing

    if @listing.save
      flash[:notice] = "Your Listing Has Been Created!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "There Was a Problem With Your Listing."
      render 'new'
    end
  end

  def edit
    @listing = Listing.find(params[:id])
    @user = @listing.user
    @photo = Photo.new
  end

  def update
    @user = User.find(params[:user_id])
    @listing = Listing.find(params[:id])

    if @listing.update(listing_params)
      flash[:notice] = "Your Listing Has Been Updated!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "There Was a Problem With Your Listing."
      render 'edit'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to root_path
  end

  private
    def listing_params
      params.require(:listing).permit(:search, :address, :city, :bedroom_count, :bathroom_count, :bed_type, :room_type, :description, :nightly_rate, :weekly_rate, :monthly_rate)
    end

end
