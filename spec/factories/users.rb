FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    password Faker::Internet.password
    password_confirmation { |u| u.password }
    email Faker::Internet.email
    bio Faker::Lorem.characters(80)
  end
end
