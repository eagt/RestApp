json.extract! line_item, :id, :qty, :total, :order_id_id, :product_id_id, :item_status, :created_at, :updated_at
json.url line_item_url(line_item, format: :json)
