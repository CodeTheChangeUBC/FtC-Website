require 'test_helper'

class FundraisersIndexTest < ActionDispatch::IntegrationTest

  def setup
  	@fundraiser = fundraisers(:fundraiser)
    @admin = users(:admin)
  	@non_admin = users(:tester)
  end

  test "index as admin including delete links" do
    log_in_as(@admin)
    get events_path
    assert_template 'events/index'
    Fundraiser.all.each do |f|
      assert_select 'a[href=?]', fundraiser_path(f), text: 'Delete'
    end
    assert_difference 'Fundraiser.count', -1 do
      delete fundraiser_path(@fundraiser)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get events_path
    assert_select 'a', text: 'delete', count: 0
  end

end
