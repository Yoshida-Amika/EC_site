class Item < ApplicationRecord

  has_one_attached :image

   def get_image(width, height)
     image.variant(resize: "#{width}x#{height}").processed
   end

  def add_tax_price
    (self.price * 1.10).round
  end

   has_many :cart_items, dependent: :destroy

end
