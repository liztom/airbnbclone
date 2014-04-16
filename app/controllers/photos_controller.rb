class PhotosController < ApplicationController
  def create
    @listing = Listing.find(params[:listing_id])
    @photo = Photo.new(photo_params)
    @listing.photos << @photo

    if @photo.save
      redirect_to :back
    else
      render 'listing/show'
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
