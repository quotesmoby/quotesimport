require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get liveSearch" do
    get :liveSearch
    assert_response :success
  end

end
