# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  number         :integer
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
#class Order < ApplicationRecord
#  belongs_to :restaurante
#  belongs_to :table
#  has_many :line_items, dependent: :destroy
#end

class Order < ApplicationRecord
  belongs_to :table
  has_many :line_items, dependent: :destroy

  enum order_status: { in_progress: 0, taken: 1 }

  after_save :update_status

  private

  def update_status
    self.taken! if line_items.any?
  end
end

