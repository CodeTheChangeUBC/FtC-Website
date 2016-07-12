class ContactFormMailer < ApplicationMailer

	def contact_form_email(message)
		@message = message
		@subject_constant = "New Message from #{@message[:subject]}"
		@subject = @message[:subject] == nil ? @subject_constant : @subject_constant + @message[:subject]
		# Ben's email for testing purposes. Replace later with FTC's email. 
		mail to: "ben.ih.chugg@gmail.com", from: @message[:email], subject: @subject
	end

end
