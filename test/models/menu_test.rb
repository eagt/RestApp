# == Schema Information
#
# Table name: menus
#
#  id             :bigint           not null, primary key
#  menu_type      :string
#  week_day       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  product_id     :bigint           not null
#  restaurante_id :bigint           not null
#
# Indexes
#
#  index_menus_on_product_id      (product_id)
#  index_menus_on_restaurante_id  (restaurante_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (restaurante_id => restaurantes.id)
#
require "test_helper"

class MenuTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
