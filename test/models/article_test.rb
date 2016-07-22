require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  
  def setup
  	@article = Article.new(title: "Title", text: "Text")
  end

  test "should be valid" do
  	assert @article.valid?
  end

  test "should have title and text" do
  	@article.title = ""
  	assert_not @article.valid?
  	@article.title = "title"
  	@article.text = ""
  	assert_not @article.valid?
  	@article.title
  	assert_not @article.valid?
  end
end
