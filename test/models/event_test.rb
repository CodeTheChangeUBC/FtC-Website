require 'test_helper'

class EventTest < ActiveSupport::TestCase
  
  def setup
  	@event = Event.new(title: "Title", description: "Description", 
                        start_time: Date.today)
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

  test "start time should be present" do
    @event.start_time = nil
    assert_not @event.valid?
  end

  test "should set attr_accessors"  do
    @event.num_volunteers = 2
    @event.duration = 2
    assert @event.valid?
  end
end
