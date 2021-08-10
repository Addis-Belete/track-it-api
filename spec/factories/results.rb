FactoryBot.define do
  factory :result do
    result { Faker::Number.number(10) }
    measurment_id { nil }
  end
end
