require "test_helper"

class ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shops_index_url
    assert_response :success
  end

  test "should get view" do
    get shops_view_url
    assert_response :success
  end
end
