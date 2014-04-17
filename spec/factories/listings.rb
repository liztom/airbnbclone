FactoryGirl.define do
  factory :listing do
    address Faker::Address.street_address
    city Faker::Address.city
    bedroom_count Faker::Number.digit
    bathroom_count Faker::Number.digit
    description Faker::Lorem.sentences(3)
    nightly_rate Faker::Number.digit
    weekly_rate Faker::Number.digit
    monthly_rate Faker::Number.digit
    room_type Faker::Lorem.characters(10)
    bed_type Faker::Lorem.characters(10)
  end
end
