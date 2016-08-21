require 'test_helper'

class UserEventSignupTest < ActionDispatch::IntegrationTest
  
  def setup 
  	@user = users(:tester)
  	@event = events(:event)
  end

  test "should sign user up for event" do
  	assert_difference '@user.events.size', 1 do
	  @user.sign_up_for_event(@event)
	 end
  end

  test "shouldn't sign user up more than once" do
  	assert_difference '@user.events.size', 1 do
	  @user.sign_up_for_event(@event)
	  @user.sign_up_for_event(@event)
	end
  end

  test "should decrease user event count when event deleted" do
  	@user.sign_up_for_event(@event)
  	@event.destroy
  	assert @user.events.size === 0
  end

  test "should decrease event's count when user is deleted" do
  	@user.sign_up_for_event(@event)
  	assert_difference '@event.users.size', -1 do
  		@user.destroy
  	end
  end

end
