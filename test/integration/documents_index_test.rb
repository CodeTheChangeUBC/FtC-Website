require 'test_helper'

class DocumentsIndexTest < ActionDispatch::IntegrationTest
  
  def setup
  	@document = documents(:document)
    @admin = users(:admin)
  	@non_admin = users(:tester)
  end

  test "documents index as admin including pagination delete functionality" do
    log_in_as(@admin)
    get documents_path
    assert_template 'documents/index'
    assert_select 'div.pagination'
    assert_difference 'Document.count', -1 do
      delete document_path(@document)
    end
  end

  test "should see all documents as member" do
  	log_in_as(@non_admin)
  	get documents_path
  	assert_template 'documents/index'
    assert_select 'div.pagination'
    i = 0
    for j in 1..2 do
   	  Document.paginate(page: j).each do |doc|
  	    i += 1
  	  end
  	end
  	assert_equal 60, i
  end

  test "should not see private documents as non-member" do
  	get documents_path
  	assert_template 'documents/index'
    assert_select 'div.pagination'
    i = 0
    for j in 1..2 do
   	  Document.paginate(page: j).each do |doc|
   	  	assert_no_match 'Private', document_path(doc)
   	  end
  	end
  end

  test "documents index as non-admin" do
    log_in_as(@non_admin)
    get documents_path
    assert_select 'a', text: 'delete', count: 0
  end
  
end
