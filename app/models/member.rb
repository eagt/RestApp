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
