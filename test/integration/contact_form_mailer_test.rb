require 'test_helper'

class ContactFormMailerTest < ActionDispatch::IntegrationTest

  def setup 
  	ActionMailer::Base.deliveries.clear
  	@content = "This is valid content for a message"
  end

  test "invalid contact form message" do
  	get contact_path
  	post contact_path, params: { 
  						 contact_form_message: { 
  							name: "", 
  							email: "", 
  							subject: "subject",
  							content: @content 
  						  }
  						} 
  	follow_redirect!
  	assert_not flash.empty?
  	assert_equal 0, ActionMailer::Base.deliveries.size 
  end
  
  test "valid contact form message" do
  	get contact_path
  	post contact_path, params: { 
  						 contact_form_message: { 
  							name: "Test User", 
  							email: "user@example.com", 
  							content: @content 
  						  }
  						} 
  	assert_equal 1, ActionMailer::Base.deliveries.size
  end

end
