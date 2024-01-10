class Item < ApplicationRecord

  has_one_attached :image

   def get_image(width, height)

      unless image.attached?
      file_path = Rails.root.join('app/assets/images/vegetable_lettuce.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize: "#{width}x#{height}").processed
    end

  def add_tax_price
    (self.price * 1.10).round
  end

   has_many :cart_items, dependent: :destroy

end
