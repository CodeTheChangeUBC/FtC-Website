require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
    @webpage_header = "FTC UBC"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "Get Involved | " + @webpage_header
  end

end
