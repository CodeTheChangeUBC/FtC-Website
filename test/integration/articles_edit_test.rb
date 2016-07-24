require 'test_helper'

class ArticlesEditTest < ActionDispatch::IntegrationTest
  
  def setup
  	@article = articles(:article1)
 	  @admin = users(:admin)
  end

  test "successful edit" do
    log_in_as(@admin)
   	get edit_article_path(@article)
  	assert_template 'articles/edit'
  	patch article_path(@article), params: { article: { title: "New title", 
  												       text: "New text" } }
	  assert_not flash.empty?
	  assert_redirected_to @article
	  @article.reload  												 
  	assert_equal "New title", @article.title
  	assert_equal "New text", @article.text
  end

  test "unsuccesful edit due to no title" do 
     log_in_as(@admin)
	   patch article_path(@article), params: { article: { title: "", 
	                                      		  	     text: @article.text } }
	   assert_template 'articles/edit'
  end

  test "unsuccesful edit due to no text" do 
  	 log_in_as(@admin)
	   patch article_path(@article), params: { article: { title: @article.title, 
	                                		  	      text: "" } }
	   assert_template 'articles/edit'
  end

end
