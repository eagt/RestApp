# == Schema Information
#
# Table name: restaurantes
#
#  id         :bigint           not null, primary key
#  NIT        :integer
#  VAT        :string
#  address_1  :string
#  address_2  :string
#  city       :string
#  country    :string
#  email      :string
#  mobile     :string
#  name       :string
#  post_code  :string
#  telephone  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Restaurante < ApplicationRecord

    validates :name, presence: true
    
    has_many  :members, dependent: :destroy 
    has_many  :users, through: :members   
    has_many :products, dependent: :destroy 
    has_many :tables, dependent: :destroy 
    has_many :menus, dependent: :destroy 
       
end



#has_many :tables
    #has_many :orders
    #has_many :sells
