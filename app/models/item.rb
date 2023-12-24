class Item < ApplicationRecord

  has_one_attached :image

  def get_image
    image.variant(resize_to_limit: [100, 100]).processed
  end

  def add_tax_price
    (self.price * 1.10).round
  end

end
