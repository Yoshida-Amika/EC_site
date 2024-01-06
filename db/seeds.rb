# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "iii@iii" ,
  password: "111111"
)

image_path = Rails.root.join('app', 'assets', 'images', 'no_image.jpg')
image_file = File.open(image_path)
item = Item.create!(
  name: "チョコケーキ",
  introduction: "チョコ",
  price: "2000",
)
item.image.attach(io: image_file, filename: 'chocolate_cake.jpg')
image_file.close

