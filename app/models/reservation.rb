class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing
  has_many :reviews, as: :commentable
  validate :checkin_cannot_be_in_the_past, :checkout_cannot_be_before_checkin, :dates_cannot_be_reserved_if_already_taken

  def checkin_cannot_be_in_the_past
    if self.checkin < Time.now
      errors.add(:checkin, " cannot be before today.")
    end
  end

  def checkout_cannot_be_before_checkin
    if self.checkout < self.checkin
      errors.add(:checkout, " cannot be before checkin.")
    end
  end

  def dates_cannot_be_reserved_if_already_taken
    reservations = Reservation.where(listing_id: self.listing_id)
    reservations.each do |res|
      if (self.checkin.between?(res.checkin, res.checkout) || self.checkout.between?(res.checkin, res.checkout))
        errors.add(:checkin, "Dates are already taken.")
      end
    end
  end

  def send_reservation_message
    listing = Listing.find(self.listing_id)
    renter = User.find(self.user_id)
    owner = listing.user
    CustomMailer.reservation_made(owner, renter)
  end
end
