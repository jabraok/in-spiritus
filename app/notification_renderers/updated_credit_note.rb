class UpdatedCreditNote
  def initialize notification
    @credit_note = notification.credit_note
  end

  def generate_mail_content
    credit_note = @credit_note
    html = ERB.new(File.open('app/views/emails/updated_credit_note_notification.html.erb').read).result(binding)
    txt = ERB.new(File.open('app/views/emails/updated_credit_note_notification.txt.erb').read).result(binding)

    date_fmt = credit_note.date.strftime('%d/%m/%y')
    subject = "New updated credit note - MLVK - #{credit_note.credit_note_number} - #{date_fmt}"

    {
      :html => html,
      :txt => txt,
      :subject => subject
    }
  end
end
