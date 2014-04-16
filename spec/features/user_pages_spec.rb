require 'spec_helper'

describe User do
  it 'allows a new user to create an account' do
    visit new_user_registration_path
    user = FactoryGirl.build(:user)
    fill_in :user_name, with: user.name
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: user.password
    fill_in :user_bio, with: user.bio
    attach_file('Avatar', '../../desktop/Cow_highland_cattle.jpg')
    click_button "Register"
    page.should have_content "Welcome"
  end
end
