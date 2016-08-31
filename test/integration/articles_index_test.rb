require 'test_helper'

class ArticlesIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
  	@non_admin = users(:tester)
  	@article = articles(:article1)
  end

  test "articles index as admin including delete links" do
    log_in_as(@admin)
    get articles_path
    assert_template 'articles/index'
    assert_select 'div.pagination'
    @articles = Article.paginate(page: 1)
    @articles.each do |article|
      assert_select 'a', text: 'Delete'
      assert_select 'a', text: 'Update'
    end
    assert_difference 'Article.count', -1 do
      delete article_path(@article)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get articles_path
    assert_select 'a', text: 'Delete', count: 0
  end
  
end
