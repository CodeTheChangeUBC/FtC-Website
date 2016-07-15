require 'test_helper'

class EventsIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = users(:admin)
  	@non_admin = users(:tester)
  	@event = events(:event)
  end

  test "events index as admin including delete links" do
    log_in_as(@admin)
    get events_path
    assert_template 'events/index'
    @events = Event.all
    @events.each do |event|
      assert_select 'a[href=?]', event_path(event), text: event.title
      assert_select 'a[href=?]', event_path(event), text: 'delete'
    end
    assert_difference 'Event.count', -1 do
      delete event_path(@event)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get events_path
    assert_select 'a', text: 'delete', count: 0
  end
  
end
