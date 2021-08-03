require "test_helper"

class TokenControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get token_new_url
    assert_response :success
  end

  test "should get show" do
    get token_show_url
    assert_response :success
  end

  test "should get info" do
    get token_info_url
    assert_response :success
  end
end
