json.extract! order, :id, :total, :restaurante_id, :table_id, :order_status, :created_at, :updated_at
json.url order_url(order, format: :json)
