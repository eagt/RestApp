require "application_system_test_case"

class RestaurantesTest < ApplicationSystemTestCase
  setup do
    @restaurante = restaurantes(:one)
  end

  test "visiting the index" do
    visit restaurantes_url
    assert_selector "h1", text: "Restaurantes"
  end

  test "should create restaurante" do
    visit restaurantes_url
    click_on "New restaurante"

    fill_in "Nit", with: @restaurante.NIT
    fill_in "Vat", with: @restaurante.VAT
    fill_in "Address 1", with: @restaurante.address_1
    fill_in "Address 2", with: @restaurante.address_2
    fill_in "City", with: @restaurante.city
    fill_in "Country", with: @restaurante.country
    fill_in "Email", with: @restaurante.email
    fill_in "Mobile", with: @restaurante.mobile
    fill_in "Name", with: @restaurante.name
    fill_in "Post code", with: @restaurante.post_code
    fill_in "Telephone", with: @restaurante.telephone
    click_on "Create Restaurante"

    assert_text "Restaurante was successfully created"
    click_on "Back"
  end

  test "should update Restaurante" do
    visit restaurante_url(@restaurante)
    click_on "Edit this restaurante", match: :first

    fill_in "Nit", with: @restaurante.NIT
    fill_in "Vat", with: @restaurante.VAT
    fill_in "Address 1", with: @restaurante.address_1
    fill_in "Address 2", with: @restaurante.address_2
    fill_in "City", with: @restaurante.city
    fill_in "Country", with: @restaurante.country
    fill_in "Email", with: @restaurante.email
    fill_in "Mobile", with: @restaurante.mobile
    fill_in "Name", with: @restaurante.name
    fill_in "Post code", with: @restaurante.post_code
    fill_in "Telephone", with: @restaurante.telephone
    click_on "Update Restaurante"

    assert_text "Restaurante was successfully updated"
    click_on "Back"
  end

  test "should destroy Restaurante" do
    visit restaurante_url(@restaurante)
    click_on "Destroy this restaurante", match: :first

    assert_text "Restaurante was successfully destroyed"
  end
end
