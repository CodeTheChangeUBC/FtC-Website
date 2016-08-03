require 'test_helper'

class ContactFormMailerTest < ActionDispatch::IntegrationTest

  def setup 
  	ActionMailer::Base.deliveries.clear
  	@content = "This is valid content for a message"
  end

  test "name should be present" do
  	get contact_path
  	# Invalid name, valid email and content
  	post contact_path, params: { 
  						 contact_form_message: { 
  							name: "", 
  							email: "email@valid.com", 
  							subject: "subject",
  							content: @content 
  						  }
  						} 
  	follow_redirect!
  	assert_not flash.empty?
  	assert_equal 0, ActionMailer::Base.deliveries.size 
  end

  test "email should be present" do 
  	get contact_path
  	# Valid name and content, invalid email
  	post contact_path, params: { 
  						 contact_form_message: { 
  							name: "valid name", 
  							email: "", 
  							subject: "subject",
  							content: @content 
  						  }
  						} 
  	follow_redirect!
  	assert_not flash.empty?
  	assert_equal 0, ActionMailer::Base.deliveries.size 
  end

  test "email should be valid" do 
    get contact_path
    # Valid name and content, invalid email
    post contact_path, params: { 
               contact_form_message: { 
                name: "valid name", 
                email: "email@invalid", 
                subject: "subject",
                content: @content 
                }
              } 
    follow_redirect!
    assert_not flash.empty?
    assert_equal 0, ActionMailer::Base.deliveries.size 
  end


  test "content must be long enough" do
  	get contact_path
  	# Valid name and email, invalid content
  	post contact_path, params: { 
  						 contact_form_message: { 
  							name: "valid name", 
  							email: "email@valid.com", 
  							subject: "subject",
  							content: "Too short"
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
  							subject: "subject", 
  							content: @content 
  						  }
  						} 
  	assert_equal 1, ActionMailer::Base.deliveries.size
  	mail = ActionMailer::Base.deliveries.first 
  	assert_equal ["noreply@freethechildren.com"], mail.from
  	assert_equal ["ben.ih.chugg@gmail.com"], mail.to
  	assert_equal "New message from Test User", mail.subject
  end

end
