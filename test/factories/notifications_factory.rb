FactoryGirl.define do
  factory :notification do
    notification_state Notification.notification_states[:pending]

    trait :pending do
      notification_state { Notification.notification_states[:pending] }
    end

    trait :processed do
      notification_state { Notification.notification_states[:processed] }
    end

    before(:create) do |notification, evaluator|
      notification.notification_rule = NotificationRule.all.sample
    end
  end
end
