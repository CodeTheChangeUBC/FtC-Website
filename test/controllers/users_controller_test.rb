require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
  	@user = users(:tester)
  	@second_user = users(:tester2)
    @admin = users(:admin)
    @webpage_header = "FTC UBC"
  end

  test "should get new" do
    get get_involved_path
    assert_response :success
    assert_select "title", "Get Involved | " + @webpage_header
  end

  test "should get index" do
    get users_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name, 
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@second_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@second_user)
    patch user_path(@user), params: { user: { name: @user.name, 
                                              email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end

  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@second_user)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end

  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@user)
    assert_not @user.admin?
    patch user_path(@user), params: { user: { password:              'password',
                                              password_confirmation: 'password',
                                              admin: true } }
    assert_not @user.admin?
  end

  test "should not allow the exec attribute to be edited via the web" do
    log_in_as(@user)
    assert_not @user.exec?
    patch user_path(@user), params: { user: { password:              'password',
                                              password_confirmation: 'password',
                                              exec: true } }
    assert_not @user.exec?
  end
  
  
end
