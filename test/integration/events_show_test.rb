require 'test_helper'

class EventsShowTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = users(:admin)
  	@non_admin = users(:tester)
  	@event = events(:event)
  end

  test "show event as admin with update and delete links" do
  	log_in_as(@admin)
  	get event_path(@event)
  	assert_template 'events/show'
  	assert_select 'a[href=?]', edit_event_path(@event), text: 'Update'
  	assert_select 'a[href=?]', event_path(@event), text: 'Delete'
  end

  test "show event as regular member with no update or delete links" do
  	# Public
  	get event_path(@event)
  	assert_template 'events/show'
  	assert_select 'a', text: 'Update', count: 0
  	assert_select 'a', text: 'Delete', count: 0
  	# Regular club member
  	log_in_as(@non_admin)
  	get event_path(@event)
  	assert_template 'events/show'
  	assert_select 'a', text: 'Update', count: 0
  	assert_select 'a', text: 'Delete', count: 0
  end

end
