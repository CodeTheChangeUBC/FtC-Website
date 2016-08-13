require 'test_helper'

class FundraisersUpdateTest < ActionDispatch::IntegrationTest
  
  def setup 
  	@fundraiser = fundraisers(:fundraiser)
  	@admin = users(:admin)
  	@non_admin = users(:tester)
  end

  test "should not update when not logged in" do
  	patch fundraiser_path(@fundraiser), params: { fundraiser: { progress: 0,
  										                             target: 0 } }
  	assert_not_equal 0, @fundraiser.progress
  	assert_not_equal 0, @fundraiser.target
  end

  test "should not update when regular user" do
  	log_in_as(@non_admin)
  	patch fundraiser_path(@fundraiser), params: { fundraiser: { progress: 1,
  										                             target: 2 } }
  	assert_not_equal 0, @fundraiser.progress
  	assert_not_equal 0, @fundraiser.target
  end

  test "successful update from admin" do
  	log_in_as(@admin)
  	patch fundraiser_path(@fundraiser), params: { fundraiser: { progress: 1000,
  										                             target: 2000 } }
    @fundraiser.reload
  	assert_equal 1000, @fundraiser.progress
  	assert_equal 2000, @fundraiser.target
  end
end
