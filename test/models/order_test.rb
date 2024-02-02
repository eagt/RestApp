# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  order_status   :string
#  total          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  restaurante_id :bigint           not null
#  table_id       :bigint           not null
#
# Indexes
#
#  index_orders_on_restaurante_id  (restaurante_id)
#  index_orders_on_table_id        (table_id)
#
# Foreign Keys
#
#  fk_rails_...  (restaurante_id => restaurantes.id)
#  fk_rails_...  (table_id => tables.id)
#
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
