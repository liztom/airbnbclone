class PhotosController < ApplicationController
  def create
    @listing = Listing.find(params[:listing_id])
    @photo = @listing.photos.create(photo_params)

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to root_path
  end

private
  def photo_params
    params.require(:photo).permit(:picture)
  end
end
