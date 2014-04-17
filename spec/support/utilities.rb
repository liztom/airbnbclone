def sign_up(user)
  visit new_user_registration_path
  fill_in :user_name, with: user.name
  fill_in :user_email, with: user.email
  fill_in :user_password, with: user.password
  fill_in :user_password_confirmation, with: user.password
  fill_in :user_bio, with: user.bio
  attach_file('Avatar', '../../desktop/Cow_highland_cattle.jpg')
  click_button "Register"
end

def sign_in(user)
  visit root_path
  click_on "Login"
  fill_in :user_email, with: user.email
  fill_in :user_password, with: user.password
  click_button "Sign in"
end

def new_listing(listing)
  fill_in :listing_address, with: listing.address
  fill_in :listing_city, with: listing.city
  fill_in :listing_bedroom_count, with: listing.bedroom_count
  fill_in :listing_bathroom_count, with: listing.bathroom_count
  click_on "Submit"
end

