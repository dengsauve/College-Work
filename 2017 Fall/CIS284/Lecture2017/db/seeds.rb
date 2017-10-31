# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

include Faker


Restaurant.destroy_all

100.times do
  restaurant = Restaurant.create(
                             name: Company.name,
                             location: Address.city + ', ' + Address.state,
                             cuisine: Food.dish,
                             low_price_range: rand(1.0..5.0),
                             high_price_range: rand(10.0..71.0),
                             image: Placeholdit.image("#{rand(50..100)}x#{rand(50..100)}")
  )

  puts restaurant.inspect
end



