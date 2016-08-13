require 'test_helper'

class FundraiserTest < ActiveSupport::TestCase
  
  test "should be valid" do
  	@fundraiser = Fundraiser.new(target: 1000, progress: 500)
  	assert @fundraiser.valid?
  end

  test "should have target present and positive" do
  	@fundraiser = Fundraiser.new(progress: 0)
  	assert_not @fundraiser.valid?
  	@fundraiser = Fundraiser.new(target: 0, progress: 0)
  	assert_not @fundraiser.valid?
  end

  test "should have progress present and greater than zero" do
  	@fundraiser = Fundraiser.new(target: 1000)
  	assert_not @fundraiser.valid?
  	@fundraiser = Fundraiser.new(target: 1000, progress: -1)
  	assert_not @fundraiser.valid?
  end

  test "should have progress less or equal to target" do
  	@fundraiser = Fundraiser.new(target: 499, progress: 500)
  	assert_not @fundraiser.valid?
  end
end
