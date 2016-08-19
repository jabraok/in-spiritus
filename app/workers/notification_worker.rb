class NotificationWorker
  include Sidekiq::Worker

  sidekiq_options :retry => true, unique: :until_executed

  def perform

    Notification
      .pending
      .each do |n|
        if ((n.has_order? && n.notification_rule.wants_order) ||
           (n.has_credit? && n.notification_rule.wants_credit))
           send_notification n
        end

        n.mark_processed!
      end
  end

  private
  def send_notification(notification)

    renderer = notification
                .renderer
                .constantize
                .new notification

    mail_content = renderer.generate_mail_content

    notification_rule = notification.notification_rule
    recipients = [{
      :email => notification_rule.email,
      :first => notification_rule.first_name,
      :last => notification_rule.last_name
    }]

    MailUtils
      .new
      .send_email(recipients,
        mail_content[:subject],
        mail_content[:html],
        mail_content[:txt])
  end
end
