# == Schema Information
#
# Table name: products
#
#  id                  :bigint           not null, primary key
#  buying_cost_pck     :integer
#  buying_cost_unit    :integer
#  created_by          :string
#  current_stock_value :integer
#  description         :text
#  name                :string
#  product_type        :string
#  production_cost     :integer
#  qty_in_stock        :integer
#  qty_measurement     :decimal(10, 1)
#  qty_to_stock        :integer
#  selling_cost_pck    :integer
#  selling_cost_unit   :integer
#  unit_measurement    :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  restaurante_id      :bigint           not null
#
# Indexes
#
#  index_products_on_restaurante_id  (restaurante_id)
#
# Foreign Keys
#
#  fk_rails_...  (restaurante_id => restaurantes.id)
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
