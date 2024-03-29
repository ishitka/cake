class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  belongs_to :genre
  
  def with_tax_price
    (price * 1.1).floor
  end
  
  
  enum is_status: { sale: 0, stopped: 1 }
  
end
