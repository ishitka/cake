class OrderItem < ApplicationRecord
 belongs_to :order, optional: true
 belongs_to :item, optional: true
 enum production_status:{ impossibility: 0, waiting: 1, production: 2, finish: 3 }
 def with_tax_price
    (price * 1.1).floor
 end
 def subtotal
    with_tax_price * amount
 end
 
end
