require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "should create product" do
    visit products_url
    click_on "New product"

    fill_in "Buying cost pck", with: @product.buying_cost_pck
    fill_in "Buying cost unit", with: @product.buying_cost_unit
    fill_in "Created by", with: @product.created_by
    fill_in "Current stock value", with: @product.current_stock_value
    fill_in "Decimal{10-0}", with: @product.decimal{10-0}
    fill_in "Description", with: @product.description
    fill_in "Name", with: @product.name
    fill_in "Production cost", with: @product.production_cost
    fill_in "Qty-measurement", with: @product.qty-measurement
    fill_in "Qty in stock", with: @product.qty_in_stock
    fill_in "Qty to stock", with: @product.qty_to_stock
    fill_in "Restaurante", with: @product.restaurante_id
    fill_in "Selling cost pck", with: @product.selling_cost_pck
    fill_in "Selling cost unit", with: @product.selling_cost_unit
    fill_in "Unit measurement", with: @product.unit_measurement
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "should update Product" do
    visit product_url(@product)
    click_on "Edit this product", match: :first

    fill_in "Buying cost pck", with: @product.buying_cost_pck
    fill_in "Buying cost unit", with: @product.buying_cost_unit
    fill_in "Created by", with: @product.created_by
    fill_in "Current stock value", with: @product.current_stock_value
    fill_in "Decimal{10-0}", with: @product.decimal{10-0}
    fill_in "Description", with: @product.description
    fill_in "Name", with: @product.name
    fill_in "Production cost", with: @product.production_cost
    fill_in "Qty-measurement", with: @product.qty-measurement
    fill_in "Qty in stock", with: @product.qty_in_stock
    fill_in "Qty to stock", with: @product.qty_to_stock
    fill_in "Restaurante", with: @product.restaurante_id
    fill_in "Selling cost pck", with: @product.selling_cost_pck
    fill_in "Selling cost unit", with: @product.selling_cost_unit
    fill_in "Unit measurement", with: @product.unit_measurement
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "should destroy Product" do
    visit product_url(@product)
    click_on "Destroy this product", match: :first

    assert_text "Product was successfully destroyed"
  end
end
