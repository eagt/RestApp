json.extract! restaurante, :id, :name, :address_1, :address_2, :post_code, :email, :telephone, :mobile, :VAT, :NIT, :city, :country, :created_at, :updated_at
json.url restaurante_url(restaurante, format: :json)
