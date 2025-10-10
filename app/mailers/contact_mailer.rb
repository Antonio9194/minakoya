class ContactMailer < ApplicationMailer
  default to: "antoniov@morikoyahotel.com"

  def new_message(contact_message)
    @contact_message = contact_message
    mail(
      from: @contact_message.email,
      subject: "New Message from #{@contact_message.name}"
    )
  end
end
