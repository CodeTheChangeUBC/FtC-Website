require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
  	@article = articles(:article1)
  	@user = users(:tester)
    @admin = users(:admin)
    @webpage_header = "FTC UBC"
  end

  test "should get index" do
    get articles_path
    assert_response :success
    assert_select "title", "Club Updates | " + @webpage_header
  end


  test "should get new if admin" do
  	log_in_as(@admin)
    get new_article_path
    assert_response :success
    assert flash.empty?
    assert_select "title", "New Article | " + @webpage_header
  end

  test "should get edit if admin" do
  	log_in_as(@admin)
    get edit_article_path(@article)
    assert_response :success
    assert flash.empty?
    assert_select "title", "Edit Article | " + @webpage_header
  end
 
  test "should redirect new when not admin" do
  	# Nobody logged in. 
  	get new_article_path
  	assert_not flash.empty?
  	assert_redirected_to root_url
  	# Logged in as regular user
  	log_in_as(@user)
  	get new_article_path
  	assert_not flash.empty?
  	assert_redirected_to root_url
  end

  test "should redirect edit when not admin" do
  	# Nobody logged in. 
    get edit_article_path(@article)
    assert_not flash.empty?
    assert_redirected_to root_url
    # Logged in as regular user
    log_in_as(@user)
    get edit_article_path(@article)
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when not admin" do
  	# Nobody logged in. 
    patch article_path(@article), params: { article: { title: @article.title, 
                                                	   text: @article.text } }
    assert_not flash.empty?
    assert_redirected_to root_url
    # Logged in as regular user
    log_in_as(@user)
    patch event_path(@article), params: { article: { title: @article.title, 
                                                   text: @article.text } }
    assert_not flash.empty?
    assert_redirected_to root_url
  end

end

