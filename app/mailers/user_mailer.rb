class UserMailer < ActionMailer::Base
  default :from => "#{ENV['EMAIL_LOGIN']}@#{ENV['EMAIL_DOMAIN']}"
  def contact_mail(contact)
  	@contact = contact
    attachments[contact[:attachment].original_filename] = File.read(contact[:attachment].tempfile)

  	mail to: ENV['EMAIL_RECEIVER'],
  		 bcc: 'pedrozath@gmail.com',
  		 subject: "#{contact[:name]} enviou uma mensagem",
  		 reply_to: contact[:email]
  end
end