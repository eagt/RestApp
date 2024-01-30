class Table < ApplicationRecord
  belongs_to :restaurante

  enum status: { Funcional: 'Funcional', Pidiendo: 'Pidiendo', No_Funcional: 'No Funcional' }
end
