# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

include Faker


=begin

Restaurant.destroy_all

200.times do
  restaurant = Restaurant.create(
                             name: Company.name,
                             location: Address.city + ', ' + Address.state,
                             cuisine: Food.dish,
                             low_price_range: rand(1.0..5.0),
                             high_price_range: rand(10.0..71.0),
                             image: Placeholdit.image("#{rand(50..100)}x#{rand(50..100)}")
  )
  rand(3..5).times do
    restaurant.reviews.create(
                          name: Name.first_name,
                          review_text: Lorem.paragraph,
                          rating: rand(1..5)
    )
  end
  puts restaurant.inspect
end

=end

#=begin
Product.destroy_all

200.times do
  retail = ( Commerce.price + rand(10000) )
  image_id = rand(1..10)

  product = Product.create(
                       name: Commerce.product_name, #string
                       description: Lorem.paragraph(8), # textarea
                       quantity_on_hand: rand(500), # integer
                       selling_price: retail, # decimal
                       cost: (retail * 0.8), # decimal
                       shipping_weight: rand(2..75), # integer
                       image_thumbnail: LoremPixel.image("150x150", false, 'technics', image_id), # image URL 150x150
                       image_full: LoremPixel.image("1920x1080", false, 'technics', image_id) # image URL 1920x1080 TODO: Ensure these two match!
  )

  rand(0..10).times do
    product_review = ProductReview.create(
                                      author: Name.name,
                                      comment: Lorem.paragraph,
                                      rating: rand(1..10),
                                      product_id: product.id
    )

    puts product_review.inspect
  end

  puts product.inspect
end

#=end

# Article Seeds

=begin
Article.destroy_all

200.times do
  article = Article.create(
                       title: MostInterestingManInTheWorld.quote,# string
                       author: Name.name,# string
                       published_date: Faker::Date.between(100.days.ago, Date.today),# datetime
                       published: Boolean.boolean(0.8),# boolean
                       context: Lorem.paragraphs.join(' '),# text field
                       avatar_url: LoremPixel.image("150x150", false, 'people')# string url to image
  )

  puts article.inspect
end
=end