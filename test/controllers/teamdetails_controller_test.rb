require 'test_helper'

class TeamdetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get teamdetails_new_url
    assert_response :success
  end

end
