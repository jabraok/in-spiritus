FactoryGirl.define do
  factory :setting do
    key         { Faker::Lorem.characters(10) }
    label       { Faker::Lorem.sentence }
    value       { Faker::Lorem.sentence }
  end
end
