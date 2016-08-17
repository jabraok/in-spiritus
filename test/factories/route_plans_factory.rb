FactoryGirl.define do
  factory :route_plan do
    date { Date.tomorrow }
    published_state RoutePlan.published_states[:published]

    factory :route_plan_with_route_visits do
      transient do
        route_visits_count 5
      end

      after(:create) do |route_plan, evaluator|
        create_list(:route_visit,
          evaluator.route_visits_count,
          route_plan: route_plan)
      end
    end
  end
end
