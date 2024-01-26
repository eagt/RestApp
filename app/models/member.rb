class Member < ApplicationRecord
  belongs_to :user
  belongs_to :restaurante

  enum rte_role: { mesero: 'mesero', mesera: 'mesera', cocinero: 'cocinero', cocinera: 'cocinero', supervisor: 'supervisor', supervisora: 'supervisora' }
end
