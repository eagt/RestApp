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
class Product < ApplicationRecord
  
  belongs_to :restaurante
  has_many :line_items

  # calling all the concern for Number parsing for the integer inputs 
  include ProductNumberInput


  enum product_type: { Almuerzo:'Almuerzo', Bebida_Caliente: 'Bebida Caliente', Bebida_Fría:'Bebida_Fría', Desayuno: 'Desayuno', Otros_Alimentos:'Otros_Alimentos' }

#def buying_cost_pck=(value)
#  # Replace the dot with an empty string and then convert the value to an integer
#  super(value.to_s.gsub('.', '').to_i)
#end
#
#def production_cost=(value)
#  # Replace the dot with an empty string and then convert the value to an integer
#  super(value.to_s.gsub('.', '').to_i)
#end
#
#def selling_cost_unit=(value)
#  # Replace the dot with an empty string and then convert the value to an integer
#  super(value.to_s.gsub('.', '').to_i)
#end
#
end




#class Product < ApplicationRecord
#
#  belongs_to :restaurante
#  before_save :convert_price_and_qty_to_integer
#
#
#  enum product_type: { Almuerzo:'Almuerzo', Bebida_Caliente: 'Bebida Caliente', Bebida_Fría:'Bebida_Fría', Desayuno: 'Desayuno', Otros_Alimentos:'Otros_Alimentos' }
#
#  # Define the custom setter method
#  def convert_price_and_qty_to_integer
#    self.buying_cost_pck = parse_integer_with_commas(buying_cost_pck)
#    self.production_cost = parse_integer_with_commas(production_cost)
#    self.selling_cost_unit = parse_integer_with_commas(selling_cost_unit)
#  end 
#
#
#  def parse_integer_with_commas(value)
#    # Replace commas with nothing and convert to integer
#    value.to_s.gsub('.', '').to_i
#  end
## Define the method to sanitize number fields
# #def sanitize_number_fields
# #  set_number_with_dot(:selling_cost_unit, self[:selling_cost_unit]) if selling_cost_unit_changed?
# #end
#end
