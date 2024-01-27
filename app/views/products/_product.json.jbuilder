json.extract! product, :id, :name, :qty-measurement, :unit_measurement, :description, :buying_cost_pck, :buying_cost_unit, :selling_cost_pck, :selling_cost_unit, :production_cost, :qty_to_stock, :qty_in_stock, :current_stock_value, :decimal{10-0}, :created_by, :restaurante_id, :created_at, :updated_at
json.url product_url(product, format: :json)
