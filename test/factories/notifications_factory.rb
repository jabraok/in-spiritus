FactoryGirl.define do
  factory :notification do
    notification_state Notification.notification_states[:pending]
    order
    credit_note
    notification_rule

    # trait :pending do
    #   notification_state { Notification.notification_states[:pending] }
    # end
    #
    # trait :processed do
    #   notification_state { Notification.notification_states[:processed] }
    # end
  end
end
