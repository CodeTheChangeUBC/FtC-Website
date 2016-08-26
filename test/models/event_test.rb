require 'test_helper'

class EventTest < ActiveSupport::TestCase
  
  def setup
  	@event = Event.new(title: "Title", description: "Description", 
                        start_time: Date.today)
  end

  test "should be valid" do
  	assert @event.valid?
  end

  test "assert all major event booleans false" do
    assert_not @event.ee_challenge
    assert_not @event.we_day
    assert_not @event.vow_silence
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

  test "should set ee challenge" do
    @event.ee_challenge = true
    assert @event.valid?
  end

  test "should set vow of silence" do
    @event.vow_silence = true
    assert @event.valid?
  end

  test "should set we day" do
    @event.we_day = true
    assert @event.valid?
  end


  test "should set multiple major events (if necessary)" do
    @event.ee_challenge = true
    @event.we_day = true
    @event.vow_silence = true
    assert @event.valid?
  end
end
