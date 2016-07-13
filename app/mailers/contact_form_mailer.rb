class ContactFormMailer < ApplicationMailer

	def contact_form_email(message)
		@message = message
		@subject = "New message from #{@message[:name]}"
		# Ben's email for testing purposes. Replace later with FTC's email. 
		mail to: "ben.ih.chugg@gmail.com", 
			 from: "Contact Form Message", 
			 subject: @subject
	end

end
