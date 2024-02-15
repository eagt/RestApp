require "test_helper"

class MenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu = menus(:one)
  end

  test "should get index" do
    get menus_url
    assert_response :success
  end

  test "should get new" do
    get new_menu_url
    assert_response :success
  end

  test "should create menu" do
    assert_difference("Menu.count") do
      post menus_url, params: { menu: { menu_type: @menu.menu_type, product_id: @menu.product_id, restautante_id: @menu.restautante_id, week_day: @menu.week_day } }
    end

    assert_redirected_to menu_url(Menu.last)
  end

  test "should show menu" do
    get menu_url(@menu)
    assert_response :success
  end

  test "should get edit" do
    get edit_menu_url(@menu)
    assert_response :success
  end

  test "should update menu" do
    patch menu_url(@menu), params: { menu: { menu_type: @menu.menu_type, product_id: @menu.product_id, restautante_id: @menu.restautante_id, week_day: @menu.week_day } }
    assert_redirected_to menu_url(@menu)
  end

  test "should destroy menu" do
    assert_difference("Menu.count", -1) do
      delete menu_url(@menu)
    end

    assert_redirected_to menus_url
  end
end
