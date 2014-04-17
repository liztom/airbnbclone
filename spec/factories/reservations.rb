FactoryGirl.define do
  factory :reservation do
    checkin Faker::Name.name
    checkout Faker::Internet.password(8)
  end
end
