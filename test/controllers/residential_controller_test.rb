require 'test_helper'

class ResidentialControllerTest < ActionDispatch::IntegrationTest
  test "should get residential" do
    get residential_residential_url
    assert_response :success
  end

end
