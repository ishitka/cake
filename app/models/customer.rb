class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :cart_items,dependent: :destroy
  
  def customer_display
    '〒' + postal_code + '' + address + '' + first_name + '' + last_name + ''
  end
  
end
