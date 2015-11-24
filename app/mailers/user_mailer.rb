class UserMailer < ActionMailer::Base
  default :from => "#{ENV['EMAIL_LOGIN']}@#{ENV['EMAIL_DOMAIN']}"
  def contact_mail(contact)
  	@contact = contact

    unless contact[:attachment].nil?
    	attachments[contact[:attachment].original_filename] = File.read(contact[:attachment].tempfile)
    end

  	mail to: ENV['EMAIL_RECEIVER'],
  		 subject: "#{contact[:name]} enviou uma mensagem",
  		 reply_to: contact[:email]
  end
end