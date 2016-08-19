class MailUtils
  include MailGunUtils

  def send_email(recipients, subject, body_html=nil, body_text=nil, attachments=[])
    validate(recipients,
      subject,
      body_html,
      body_text,
      attachments)

    from = {
      :email => ENV['SALES_FROM_EMAIL'],
      :first => "Aram",
      :last => "Zadikian"
    }

    super(from,
      recipients,
      subject,
      body_html,
      body_text,
      attachments)
  end

  private
  def validate(recipients, subject, body_html, body_text, attachments)
		raise "recipients can not empty" if recipients.nil? || !recipients.any?
		raise "subject can not epty" if subject.empty?
		raise "Both of body_html and body_text can not empty" if body_html.empty? && body_text.empty?
	end
end
