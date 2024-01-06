class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details


  enum payment_method: { credit_card: 0, transfer: 1 }

  enum address_method: { my_address: 0, registered_address: 1, new_address: 2 }

  def order_total_amount
    total = 0
    self.order_details.each do |order_detail|
      total += order_detail.amount
    end
    return total
  end





end
