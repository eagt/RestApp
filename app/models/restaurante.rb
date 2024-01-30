class Restaurante < ApplicationRecord

    validates :name, presence: true
    
    has_many  :members, dependent: :destroy 
    has_many  :users, through: :members   
    has_many :products, dependent: :destroy 
    has_many :tables, dependent: :destroy 
       
end



#has_many :tables
    #has_many :orders
    #has_many :sells