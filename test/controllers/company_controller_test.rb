require 'test_helper'

class CompanyControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get company_top_url
    assert_response :success
  end

end
