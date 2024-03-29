# == Schema Information
#
# Table name: tables
#
#  id             :bigint           not null, primary key
#  number         :string
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  restaurante_id :bigint           not null
#
# Indexes
#
#  index_tables_on_restaurante_id  (restaurante_id)
#
# Foreign Keys
#
#  fk_rails_...  (restaurante_id => restaurantes.id)
#
class Table < ApplicationRecord

  belongs_to :restaurante
  has_many :orders
  enum status: { Funcional: 'Funcional', Pidiendo: 'Pidiendo', No_Funcional: 'No Funcional' }

  validates :number, :restaurante, :status, presence: true
  validates :number, uniqueness: { scope: :restaurante_id, message: "Ya existe una mesa con ese número" }
end
