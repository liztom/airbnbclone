class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :reviews, as: :commentable

  has_many :tags
  has_many :amenities, :through => :tags


  def self.search_by_city(query)
    Listing.where("lower(city) = ?", query.downcase).to_a
  end


end
