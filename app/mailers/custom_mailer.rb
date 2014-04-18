class CustomMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers

  def reservation_made(owner, renter)
    @owner = owner
    @renter = renter
    mail to: owner.email, subject: "Bear BNB Reservation"
    mail to: renter.email, subject: "Bear BNB Reservation"

  end
end
