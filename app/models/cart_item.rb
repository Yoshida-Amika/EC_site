class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

  def add_tax_price
    (self.item.price * 1.10).round
  end

  def subtotal
    self.add_tax_price * amount
  end


end
