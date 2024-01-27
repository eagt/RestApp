require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { buying_cost_pck: @product.buying_cost_pck, buying_cost_unit: @product.buying_cost_unit, created_by: @product.created_by, current_stock_value: @product.current_stock_value, decimal{10-0}: @product.decimal{10-0}, description: @product.description, name: @product.name, production_cost: @product.production_cost, qty-measurement: @product.qty-measurement, qty_in_stock: @product.qty_in_stock, qty_to_stock: @product.qty_to_stock, restaurante_id: @product.restaurante_id, selling_cost_pck: @product.selling_cost_pck, selling_cost_unit: @product.selling_cost_unit, unit_measurement: @product.unit_measurement } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { buying_cost_pck: @product.buying_cost_pck, buying_cost_unit: @product.buying_cost_unit, created_by: @product.created_by, current_stock_value: @product.current_stock_value, decimal{10-0}: @product.decimal{10-0}, description: @product.description, name: @product.name, production_cost: @product.production_cost, qty-measurement: @product.qty-measurement, qty_in_stock: @product.qty_in_stock, qty_to_stock: @product.qty_to_stock, restaurante_id: @product.restaurante_id, selling_cost_pck: @product.selling_cost_pck, selling_cost_unit: @product.selling_cost_unit, unit_measurement: @product.unit_measurement } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
