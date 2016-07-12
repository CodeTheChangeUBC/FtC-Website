require 'test_helper'

class ContactFormMessageTest < ActiveSupport::TestCase
  
  def setup
  	@message = ContactFormMessage.new(name: "visitor", 
  									  email: "visitor@example.com",
  									  content: "a" * 20)
  end

  test "should be valid" do 
  	assert @message.valid?
  end

  test "should not be valid" do 
  	@message.update_attributes(name: nil, email: nil, content: nil) 
  	assert_not @message.valid?
  	@message[:name] = "visitor"
  	assert_not @message.valid?
  	@message[:email] = "visitor@example.com"
  	assert_not @message.valid?
  	@message[:content] = "a" * 19
  	assert_not @message.valid?
  	@message[:content] = "a" * 20
  	assert @message.valid?
  	@message[:subject] = "subject"
  	assert @message.valid?
  end

end
