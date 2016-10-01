FactoryGirl.define do
  factory :company do
    is_customer true
    is_vendor false
    name { Faker::Company.name }
    terms 7
    price_tier

    trait :synced do
      xero_state { Company.xero_states[:synced] }
      xero_id { SecureRandom.hex(10) }
    end

    trait :vendor do
      is_customer false
      is_vendor true
    end

    factory :company_with_locations do
      transient do
        location_count 3
      end

      after(:create) do |company, evaluator|
        create_list(:location, evaluator.location_count, company: company)
      end

      before(:create) do |company, evaluator|
        company.price_tier = PriceTier.all.sample
      end
    end
  end
end
