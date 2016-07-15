require 'test_helper'

class EventTest < ActiveSupport::TestCase
  
  def setup
  	@event = Event.new(title: "Title", description: "Description")
  end

  test "should be valid" do
  	assert @event.valid?
  end

  test "title should be present" do
  	@event.title = ""
  	assert_not @event.valid?
  end

  test "description should be present" do
  	@event.description = ""
  	assert_not @event.valid?
  end

  test "should set attr_accessors"  do
    @event.num_volunteers = 2
    @event.date = Date.current
    @event.start_time = Time.current
    @event.duration = 2
    assert @event.valid?
  end
end
