class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  validate :user_has_stayed_here, :no_repeat_reviews_for_listing

  def user_has_stayed_here
    stays = Reservation.where(user_id: self.id)
    if stays.length > 0
      errors.add(:review, " cannot be written until you stay here.")
    end
  end

  def no_repeat_reviews_for_listing
    reviews = Review.where(user_id: self.user_id, commentable_type: 'Listing', commentable_id: self.commentable_id)
    if reviews.length > 0
      errors.add(:review, " has already been written for this listing.")
    end
  end
end
