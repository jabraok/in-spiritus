class UpdatedSalesOrder
  def initialize notification
    @order = notification.order
  end

  def generate_mail_content
    order = @order
    html = ERB.new(File.open('app/views/emails/updated_sales_order_notification.html.erb').read).result(binding)
    txt = ERB.new(File.open('app/views/emails/updated_sales_order_notification.txt.erb').read).result(binding)

    date_fmt = order.delivery_date.strftime('%d/%m/%y')
    subject = "New updated sales order - MLVK - #{order.order_number} - #{date_fmt}"

    {
      :html => html,
      :txt => txt,
      :subject => subject
    }
  end
end
