class Item < ApplicationRecord

  has_one_attached :image

  def get_image
    image.variant(resize_to_limit: [100, 100]).processed
  end

  def add_tax_sales_price
    (self.sales_price * 1.10).round
  end

end
