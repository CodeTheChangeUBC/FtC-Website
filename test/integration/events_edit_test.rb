require 'test_helper'

class EventsEditTest < ActionDispatch::IntegrationTest
  
  def setup
  	@event = events(:event)
 	  @admin = users(:admin)
  end

  test "successful edit" do
  	log_in_as(@admin)
  	get edit_event_path(@event)
  	assert_template 'events/edit'
  	patch event_path(@event), params: { event: { title: "New title", 
  												                       description: "New description" } }
	  assert_not flash.empty?
	  assert_redirected_to @event
	  @event.reload  												 
  	assert_equal "New title", @event.title
  	assert_equal "New description", @event.description
  end

  test "unsuccesful edit due to no title" do 
  	log_in_as(@admin)
	  patch event_path(@event), params: { event: { title: "", 
	                                		  	     description: @event.description } }
	  assert_template 'events/edit'
  end

  test "unsuccesful edit due to no description" do 
  	 log_in_as(@admin)
	   patch event_path(@event), params: { event: { title: @event.title, 
	                                		  	     description: "" } }
	   assert_template 'events/edit'
  end

end
