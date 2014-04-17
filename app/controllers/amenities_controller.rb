class AmenitiesController < ApplicationController

  def create
    @amenity = Amenity.new(amenity_params)

    if @amenity.save
      redirect_to :back
    else
      render user_listing_path(current_user, @listing)
    end
  end

  private
    def amenity_params
      params.require(:amenity).permit(:name)
    end

end
