class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable,
         :authentication_keys => [:username]
  has_many :products, dependent: :destroy
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def admin?
    has_role?(:admin)
  end
   
  def client?
    has_role?(:client)
  end     
end
