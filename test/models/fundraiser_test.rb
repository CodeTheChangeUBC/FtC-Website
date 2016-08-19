require 'test_helper'

class FundraiserTest < ActiveSupport::TestCase

  def setup
    @fundraiser = Fundraiser.new(target: 1000, progress: 500, title: "title", 
                                  description: "description")
  end
  
  test "should be valid" do
  	assert @fundraiser.valid?
  end

  test "should have target present and positive" do
  	@fundraiser.target = nil
  	assert_not @fundraiser.valid?
  	@fundraiser.target = 0
  	assert_not @fundraiser.valid?
  end

  test "should have progress present and greater than zero" do
  	@fundraiser.progress = nil
  	assert_not @fundraiser.valid?
  	@fundraiser.progress = -1
  	assert_not @fundraiser.valid?
  end

  test "should have progress less or equal to target" do
  	@fundraiser.target = 499
    @fundraiser.progress = 500
  	assert_not @fundraiser.valid?
  end

  test "should have title" do
    @fundraiser.title = ""
    assert_not @fundraiser.valid?
  end

  test "should have description" do
    @fundraiser.description = ""
    assert_not @fundraiser.valid?
  end

  test "should have description at most 500 characters" do
    @fundraiser.description = "a" * 501
    assert_not @fundraiser.valid?
    @fundraiser.description = "a" * 500
    assert @fundraiser.valid?
  end
end
