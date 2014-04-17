require 'spec_helper'

describe Listing do
  it 'allows a user to create a listing' do
    user = FactoryGirl.create(:user)
    sign_in(user)
    click_on user.name
    click_on 'New Listing'
    listing = FactoryGirl.build(:listing)
    new_listing(listing)
    page.should have_content listing.address
  end
end
