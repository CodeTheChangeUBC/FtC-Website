require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
  	@event = events(:event)
  	@user = users(:tester)
    @admin = users(:admin)
    @webpage_header = "FTC UBC"
  end

  test "should get index" do
    get events_path
    assert_response :success
    assert_select "title", "Events | " + @webpage_header
  end


  test "should get new if admin" do
  	log_in_as(@admin)
    get new_event_path
    assert_response :success
    assert flash.empty?
    assert_select "title", "New Event | " + @webpage_header
  end

  test "should get edit if admin" do
  	log_in_as(@admin)
    get edit_event_path(@event)
    assert_response :success
    assert flash.empty?
    assert_select "title", "Edit Event | " + @webpage_header
  end
 
  test "should redirect new when not admin" do
  	# Nobody logged in. 
  	get new_event_path
  	assert_not flash.empty?
  	assert_redirected_to root_url
  	# Logged in as regular user
  	log_in_as(@user)
  	get new_event_path
  	assert_not flash.empty?
  	assert_redirected_to root_url
  end

  test "should redirect edit when not admin" do
  	# Nobody logged in. 
    get edit_event_path(@event)
    assert_not flash.empty?
    assert_redirected_to root_url
    # Logged in as regular user
    log_in_as(@user)
    get edit_event_path(@event)
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when not admin" do
  	# Nobody logged in. 
    patch event_path(@event), params: { event: { title: @event.title, 
                                                description: @event.description } }
    assert_not flash.empty?
    assert_redirected_to root_url
    # Logged in as regular user
    log_in_as(@user)
    patch event_path(@event), params: { event: { title: @event.title, 
                                                description: @event.description } }
    assert_not flash.empty?
    assert_redirected_to root_url
  end

end
