class ContactFormMailer < ApplicationMailer

	def contact_form_email(message)
		@message = message
		@subject = "New message from #{@message[:name]}"
		mail to: "ubcfreethechildren@gmail.com", 
			 from: "#{message[:email]}", 
			 subject: @subject
	end

end
