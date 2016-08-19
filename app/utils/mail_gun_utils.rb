module MailGunUtils
	include PdfUtils

	def mg_client
		@mail_gun_client ||= Mailgun::Client.new(ENV['MAIL_GUN_API_KEY'])
  end

  def send_message(mb_obj)
		p "Sending email #{mb_obj}"
    mg_client.send_message ENV['MAIL_GUN_DOMAIN'], mb_obj
  end

	def email_new_purchase_order(order)
		html = ERB.new(File.open('app/views/emails/new_purchase_order.html.erb').read).result(binding)
    txt = ERB.new(File.open('app/views/emails/new_purchase_order.txt.erb').read).result(binding)
    date_fmt = order.delivery_date.strftime('%d/%m/%y')

    mb_obj = Mailgun::MessageBuilder.new
    mb_obj.from(ENV['SALES_FROM_EMAIL'], {"first"=>"Aram", "last" => "Zadikian"})
		mb_obj.add_recipient(:to, 'az@mlvegankitchen.com', {"first"=>'Aram', "last" => 'Zadikian'})
    # mb_obj.add_recipient(:to, rule.email, {"first"=>rule.first_name, "last" => rule.last_name || ""})
    mb_obj.subject("New Purchase Order - MLVK - #{order.order_number} - #{date_fmt}")
    mb_obj.body_html(html)
    mb_obj.body_text(txt)
		mb_obj.add_attachment(generate_pdfs(order), "Purchase Order - #{order.order_number} - #{date_fmt}.pdf")

		send_message mb_obj
	end

	def email_updated_purchase_order(order, attachment)

	end

	def send_email(from, recipients, subject, body_html=nil, body_text=nil, attachments=[])

		mb_obj = Mailgun::MessageBuilder.new
		mb_obj.from(from[:email], {"first" => from[:first], "last" => from[:last]})

		recipients.each do |r|
			mb_obj.add_recipient(:to, r[:email], {"first" =>r [:first], "last" => r[:last]})
		end

		mb_obj.subject(subject)
		mb_obj.body_html(body_html)
		mb_obj.body_text(body_text)

		attachments.each do |a|
			mb_obj.add_attachment(a[:file_url], a[:file_name])
		end

		send_message mb_obj
	end
end
