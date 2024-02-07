class Order < ApplicationRecord
 has_one_attached :image
 belongs_to :customer
 has_many :order_items, dependent: :destroy
 
 enum payment_method: { credit_card: 0, transfer: 1}
 
 enum status: { wait_paymethod: 0, confirm_paymethod: 1, making: 2, preparing_ship: 3, finish_prepare: 4}
 
 def with_tax_price
    (price * 1.1).floor
 end
 
  def subtotal
    with_tax_price * amount
  end
end
