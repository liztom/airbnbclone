require 'spec_helper'
require 'pry'

describe Reservation do

  it { should belong_to :user }
  it { should belong_to :listing }

  context '#checkdates?' do
    it 'Does not allow user to pick a date before today' do
      test_reservation = Reservation.create(:checkin => "2014-03-12", :checkout => "2014-05-12")
      test_reservation.checkdates?.should eq false
    end

    it 'Does not allow user to  checkout before checking in' do
      test_reservation = Reservation.create(:checkin => "2014-05-12", :checkout => "2014-05-10")
      test_reservation.checkdates?.should eq false
    end

    it 'Does not allow user to book a date that is already reserved' do
      test_reservation1 = Reservation.create(:listing_id => 1, :checkin => "2014-05-12", :checkout => "2014-05-20")
      test_reservation2 = Reservation.create(:listing_id => 1, :checkin => "2014-05-18", :checkout => "2014-05-22")
      test_reservation3 = Reservation.create(:listing_id => 1, :checkin => "2014-05-23", :checkout => "2014-05-28")
      test_reservation2.checkdates?.should eq false
    end

    it 'Allows a user to book a room if it passes all tests' do
      test_listing = Listing.create(bedroom_type: "single")
      test_reservation1 = Reservation.create(:listing_id => test_listing.id, :checkin => "2014-05-12", :checkout => "2014-05-20", :user_id => 2)
      test_reservation2 = Reservation.new(:listing_id => test_listing.id, :checkin => "2014-05-21", :checkout => "2014-05-22")
      test_reservation3 = Reservation.create(:listing_id => test_listing.id, :checkin => "2014-05-23", :checkout => "2014-05-28")
      test_reservation2.checkdates?.should eq true
    end
  end
end
