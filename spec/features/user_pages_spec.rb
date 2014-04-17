require 'spec_helper'

describe User do
  it 'allows a new user to create an account' do
    user = FactoryGirl.build(:user)
    sign_up(user)
    page.should have_content "Welcome"
  end

  it 'allows a user to edit an account' do
    user = FactoryGirl.build(:user)
    sign_up(user)
    click_link user.name
    click_link "Edit Profile"
    fill_in :user_name, with: "New Name"
    fill_in :user_current_password, with: user.password
    click_button "Update"
    page.should have_content "New Name"
  end
end
