class PhotosController < ApplicationController
  def create
    @listing = Listing.find(params[:listing_id])
    @photo = Photo.new(photo_params)
    @listing.photos << @photo

    if @photo.save
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      flash[:alert] = "There was an error uploading your photo."
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
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
