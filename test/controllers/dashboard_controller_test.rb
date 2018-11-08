require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get user_profile" do
    get dashboard_user_profile_url
    assert_response :success
  end

end
