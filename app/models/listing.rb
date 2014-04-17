class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :photos

  has_many :tags
  has_many :amenities, :through => :tags

end
