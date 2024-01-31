# == Schema Information
#
# Table name: members
#
#  id             :bigint           not null, primary key
#  rte_role       :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  restaurante_id :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_members_on_restaurante_id  (restaurante_id)
#  index_members_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (restaurante_id => restaurantes.id)
#  fk_rails_...  (user_id => users.id)
#
class Member < ApplicationRecord
  belongs_to :user
  belongs_to :restaurante
  before_create :set_member_rte_role_owner

  enum rte_role: { mesero: 'mesero', mesera: 'mesera', cocinero: 'cocinero', cocinera: 'cocinero', 
  supervisor: 'supervisor', supervisora: 'supervisora', owner: 'owner' }

  
 private
  def set_member_rte_role_owner
    if user&.role == 'owner'
      self.rte_role = 'owner'
    end
  end
end
