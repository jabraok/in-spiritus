FactoryGirl.define do
  factory :company do
    code Faker::Company.suffix
    name Faker::Company.name
    terms 7
  end
end