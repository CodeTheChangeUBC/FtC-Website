require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:tester)
    @admin = users(:admin)
    @event = events(:event)
  end
  
  test "layout links" do 
  	get root_path
  	# Assert we render the page with the correct view
  	assert_template 'static_pages/home'
  	assert_select "a[href=?]", root_path
  	assert_select "a[href=?]", get_involved_path
  	assert_select "a[href=?]", about_path
  	assert_select "a[href=?]", what_we_do_path
  	assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", vow_of_silence_path 
    assert_select "a[href=?]", ee_dance_challenge_path
    assert_select "a[href=?]", mini_we_day_path
    assert_select "a[href=?]", login_path, count: 1
    assert_select "a[href=?]", edit_user_path(@user), count: 0
    assert_select "a[href=?]", logout_path, count: 0

    # Sign in user
    log_in_as(@user)
    assert_redirected_to @user
    get edit_user_path(@user)
    assert_template 'users/edit'
    delete logout_path(@user)
    assert_redirected_to root_path
  end

  test "should not display major event link when not active" do
    log_in_as(@user)
    @event_paths = Array[ee_dance_challenge_path, vow_of_silence_path, mini_we_day_path]
    @event_paths.each do |path|
      get path 
      assert_response :success
      assert_select "a[href=?]", event_path(@event), count: 0
    end
  end

  test "should display major event link when active" do
    log_in_as(@admin)
    patch event_path(@event), params: { event: { ee_challenge: true } }
    get ee_dance_challenge_path
    assert_select "a[href=?]", event_path(@event)
  end
end
