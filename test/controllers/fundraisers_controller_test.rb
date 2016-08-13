require 'test_helper'

class FundraisersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
  	@fundraiser = fundraisers(:fundraiser)
  	@admin = users(:admin)
  	@non_admin = users(:tester)
  end

  test "should redirect create when not admin" do
  	log_in_as(@non_admin) 
  	assert_no_difference 'Fundraiser.count' do
  		post fundraisers_path, params: { fundraiser: { target: 1000, 
  													   progress: 100 } }
  	end
  	assert_redirected_to root_url
  end

  test "should redirect destroy when not admin" do
  	log_in_as(@non_admin) 
  	assert_no_difference 'Fundraiser.count' do
  		post fundraisers_path, params: { fundraiser: { target: 1000, 
  													   progress: 100 } }
  	end
  	assert_redirected_to root_url
  end

  test "succesful create when admin" do
  	log_in_as(@admin)
  	assert_difference 'Fundraiser.count', 1 do
  		post fundraisers_path, params: { fundraiser: { target: 1000, 
  													   progress: 100 } }
  	end
  end
  
end
