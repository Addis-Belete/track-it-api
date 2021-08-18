FactoryBot.define do
  factory :result do
    result { Faker::Number.number }
    measurment_id { nil }
  end
end
