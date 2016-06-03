require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  # Global webpage header to be used in all tests
  def setup
    @webpage_header = "FTC UBC"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | " + @webpage_header
  end

  test "should get get-involved" do
    get :getinvolved
    assert_response :success
    assert_select "title", "Get Involved | " + @webpage_header
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | " + @webpage_header
  end

  test "should get events" do
    get :events
    assert_response :success
    assert_select "title", "Events | " + @webpage_header
  end

end
