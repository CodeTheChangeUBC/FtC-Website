class ContactFormsController < ApplicationController

	def create 
		@message = ContactFormMessage.new(message_params)
		if @message.valid?
			ContactFormMailer.contact_form_email(@message).deliver_now
			redirect_to contact_path
			flash[:success] = "Your message has been sent. "
		else
			flash[:warning] = "An error occured while delivering this message. "
			redirect_to contact_path
		end
	end

	private 

		def message_params
			params.require(:contact_form_message).permit(:name, :email, :subject, :content)
		end

end
