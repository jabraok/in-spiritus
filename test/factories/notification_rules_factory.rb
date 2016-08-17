FactoryGirl.define do
  factory :notification_rule do
    email ENV['FACTORY_NOTIFICATION_RULE_EMAIL']
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    wants_invoice { Faker::Boolean.boolean }
    wants_credit { Faker::Boolean.boolean }
    enabled true

    factory :notification_rule_with_location do
      before(:create) do |notification_rule, evaluator|
        notification_rule.location = Location.all.sample
      end
    end
  end
end
