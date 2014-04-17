class Amenity < ActiveRecord::Base

  has_many :tags
  has_many :listings, :through => :tags

end
