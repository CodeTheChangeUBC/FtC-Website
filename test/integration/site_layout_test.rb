require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  test "layout links" do 
  	get root_path
  	# Assert we render the page with the correct view
  	assert_template 'static_pages/home'
  	assert_select "a[href=?]", root_path, count: 2
  	assert_select "a[href=?]", get_involved_path
  	assert_select "a[href=?]", about_path, count: 2
  	assert_select "a[href=?]", events_path
  	assert_select "a[href=?]", contact_path, count: 2
    assert_select "a[href=?]", vow_of_silence_path
  end
end
