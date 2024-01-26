class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  before_create :set_owner

  has_many  :members, dependent: :destroy
  has_many  :restaurantes, through: :members  
  
  private
  def set_owner    
    unless self.created_by_invite?
      self.role = 'owner'
    end
  end
end
