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
        format.html { render :back }
        format.js
      end
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

private
  def photo_params
    params.require(:photo).permit(:picture, :caption)
  end
end
