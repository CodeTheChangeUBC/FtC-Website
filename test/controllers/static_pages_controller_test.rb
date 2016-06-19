require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  # Global webpage header to be used in all tests
  def setup
    @webpage_header = "FTC UBC"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", @webpage_header
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | " + @webpage_header
  end

  test "should get what we do" do
    get :what_we_do
    assert_response :success
    assert_select "title", "What We Do | " + @webpage_header
  end

  test "should get contact us" do
    get :contact
    assert_response :success
    assert_select "title", "Contact Us | " + @webpage_header
  end

  test "should get vow of silence" do
    get :vow_of_silence
    assert_response :success
    assert_select "title", "Vow of Silence | " + @webpage_header
  end

  test "should get EE dance challenge" do
    get :ee_dance_challenge
    assert_response :success
    assert_select "title", "Evolution Endurance Dance Challenge | " + @webpage_header
  end

  test "should get mini we day" do
    get :mini_we_day
    assert_response :success
    assert_select "title", "Mini WE Day | " + @webpage_header
  end


end
