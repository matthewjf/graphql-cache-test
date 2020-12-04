# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def random_percentage(percentage)
  FFaker::Random.rand(100) < percentage
end

1000.times do
  product = Product.create!(
    name: FFaker::Name.unique.name,
    label_id: FFaker::Random.rand(100),
    active: random_percentage(80)
  )

  10.times do
    texture = random_percentage(50) ? Texture.all.sample : nil
    texture ||= Texture.create!(
      name: FFaker::Food.ingredient,
      default: random_percentage(20),
      transparent: random_percentage(50)
    )
    Variation.create!(
      name: FFaker::Company.unique.name,
      active: random_percentage(80),
      height: FFaker::Random.rand(100),
      width: FFaker::Random.rand(100),
      product: product,
      texture: texture
    )
  end
end
