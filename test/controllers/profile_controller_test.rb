require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get regist" do
    get profile_regist_url
    assert_response :success
  end

end
