class NotificationWorker
  include Sidekiq::Worker
  include MailGunUtils

  sidekiq_options :retry => true, unique: :until_executed

  def perform

    Notification
      .pending
      .each do |n|
        send_order(n.order, n.notification_rule) if n.has_order? && n.notification_rule.wants_order
        send_credit(n.credit_note, n.notification_rule) if n.has_credit? && n.notification_rule.wants_credit

        n.mark_processed!
      end
  end

  private
  def send_order(order, notification_rule)
    html = ERB.new(File.open('app/views/emails/order_notification.html.erb').read).result(binding)
    txt = ERB.new(File.open('app/views/emails/order_notification.txt.erb').read).result(binding)

    date_fmt = order.delivery_date.strftime('%d/%m/%y')
    subject = "New updated sales order - MLVK - #{order.order_number} - #{date_fmt}"

    recipients = [{
      :email => notification_rule.email,
      :first => notification_rule.first_name,
      :last => notification_rule.last_name
    }]

    send_email(recipients, subject, html, txt)
  end

  def send_credit(credit, notification_rule)
    html = ERB.new(File.open('app/views/emails/credit_notification.html.erb').read).result(binding)
    txt = ERB.new(File.open('app/views/emails/credit_notification.txt.erb').read).result(binding)

    date_fmt = credit.date.strftime('%d/%m/%y')
    subject = "New updated credit note - MLVK - #{credit.credit_note_number} - #{date_fmt}"

    recipients = [{
      :email => notification_rule.email,
      :first => notification_rule.first_name,
      :last => notification_rule.last_name
    }]

    send_email(recipients, subject, html, txt)
  end
end
