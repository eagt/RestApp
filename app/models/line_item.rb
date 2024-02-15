# == Schema Information
#
# Table name: line_items
#
#  id          :bigint           not null, primary key
#  item_status :string
#  qty         :integer
#  total       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  order_id    :bigint           not null
#  product_id  :bigint           not null
#
# Indexes
#
#  index_line_items_on_order_id    (order_id)
#  index_line_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (product_id => products.id)
#
class LineItem < ApplicationRecord
  belongs_to :order_id
  belongs_to :product_id

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
