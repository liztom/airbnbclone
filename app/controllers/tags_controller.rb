class TagsController < ApplicationController
  def create
    @amenity = Amenity.find(params[:amenity_id])
    @tag = @amenity.tags.create(listing_id: params[:listing_id])

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end

  end

  def destroy
    @tag = Tag.find(params[:id])
    @amenity = @tag.amenity
    @listing = @tag.listing
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
