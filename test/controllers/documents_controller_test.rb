require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @document = documents(:document)
    @user = users(:tester)
    @admin = users(:admin)
    @webpage_header = "FTC UBC"
  end

  test "should get index" do
    get documents_url
    assert_response :success
    assert_select "title", "Documents | " + @webpage_header
    log_in_as(@admin)
    get documents_url
    assert_response :success
  end

  test "should get new when admin" do
    log_in_as(@admin)
    get documents_url
    assert_select 'button#new-document'
    assert_select "title", "Documents | " + @webpage_header
  end

  test "should not have access to new when not admin" do
    # Public 
    get documents_url
    assert_select 'button#new-document', count: 0
    # Regular member
    log_in_as(@user)
    assert_select 'button#new-document', count: 0
  end

  test "should redirect create when not admin" do
    # Public
    post documents_path(@document), params: { document: { name: 'ATTACK', 
                                                          attachment: 'NOW'} }
    assert_redirected_to root_url
    # Regular member
    log_in_as(@user)
    post documents_path(@document), params: { document: { name: 'ATTACK', 
                                                          attachment: 'NOW'} }
    assert_redirected_to root_url
  end

  test "should redirect destroy when not admin" do
    log_in_as(@user)
    assert_no_difference 'Document.count' do
      delete document_path(@document)
    end
    assert_redirected_to root_url
  end
end
