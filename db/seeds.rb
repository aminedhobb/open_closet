# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Order.destroy_all
User.destroy_all
Product.destroy_all

puts "Creating user.."

users = [
  {
    first_name:'Jabba',
    last_name:'LeHutt',
    email:'jabbalehutt@starwars.com',
    password:'jabbajabba',
    avatar: 'http://res.cloudinary.com/do4jeuium/image/upload/v1525085589/hnd9kwhtlhl4i89wtmsl.png',
  },
  {
    first_name: 'Sebulba',
    last_name: 'LeDug',
    email: 'sebulba@starwars.com',
    password: 'sebulba',
  }
]
User.create!(users)

puts "User created!"

puts "Creating products.."
products = [
  {
    title: 'Blazer Richard James',
    category: 'Costume',
    description: 'Sharp blazer, perfect for any occasion',
    address: '33 rue de lourmel Paris',
    price_cents: '4000',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Blue Boglioni blazer',
    category: 'Costume',
    description: 'Clean blue blazer, a classic.',
    address: 'Rue Imilchil Casablanca',
    price_cents: '45000',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Max Mara Blue Jacket',
    category: 'Costume',
    description: 'Suited for an interview, a working day, or a formal event.',
    address: 'Rue de Temple, Paris',
    price_cents: '41000',
    gender: 'Women',
    user_id: User.first.id
  },
  {
    title: 'Grey Blazer Isabel Marant',
    category: 'Costume',
    description: 'Modern Blazer',
    address: '6 Avenue Marceau, Paris',
    price_cents: '35000',
    gender: 'Women',
    user_id: User.first.id
  },
  {
    title: 'Grey Suit Paul Smith',
    category: 'Costume',
    description: 'Costume perfectly suited for an interview if you want to look sharp.',
    address: 'Rue Curie, Casablanca',
    price_cents: '50000',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Green Boglioni Jacket',
    category: 'Costume',
    description: 'Original green blazer, great seasonnal look.',
    address: 'Rue Imilchil, Casablanca',
    price_cents: '40000',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Black Stella McCartney Coat',
    category: 'Costume',
    description: "Beautiful Coat, original and trendy, you won't go unnoticed.",
    address: 'Rue Imilchil, Casablanca',
    price_cents: '45000',
    gender: 'Women',
    user_id: User.first.id
  },
  {
    title: 'Gucci Evening Dress',
    category: 'Costume',
    description: 'Magic Dress, you will shine and be the star of the evening.',
    address: 'Rue Imilchil, Casablanca',
    price_cents: '85000',
    gender: 'Women',
    user_id: User.first.id
  },
  {
    title: 'Marchesa Evening Dress',
    category: 'Costume',
    description: 'The perfect dress to be remembered by everyone at the event.',
    address: 'Rue Imilchil, Casablanca',
    price_cents: '90000',
    gender: 'Women',
    user_id: User.first.id
  },
  {
    title: 'Satin Dress Danielle Frankel',
    category: 'Costume',
    description: 'A really classy dress for special occasions.',
    address: 'Rue Imilchil, Casablanca',
    price_cents: '75000',
    gender: 'Women',
    user_id: User.first.id
  },
  {
    title: 'Balenciaga Black Bag',
    category: 'Bag',
    description: 'A true Classic.',
    address: 'Rue Imilchil, Casablanca',
    price_cents: '50000',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Dolge & Gabbana Bag',
    category: 'Bag',
    description: 'Modern Bag.',
    address: 'Rue Imilchil Casablanca',
    price_cents: '43000',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Givenchy Black Bag',
    category: 'Bag',
    description: 'Beautiful Givenchy bag.',
    address: 'Rue Imilchil Casablanca',
    price_cents: '45000',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Prada Bag',
    category: 'Bag',
    description: 'Classic Prada bag.',
    address: 'Rue Imilchil Casablanca',
    price_cents: '45000',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Red Saint-Laurent Bag',
    category: 'Bag',
    description: 'Great practical bag.',
    address: 'Rue Imilchil Casablanca',
    price_cents: '45000',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Fendi Bag',
    category: 'Bag',
    description: 'Original Fendi bag',
    address: 'Rue Imilchil Casablanca',
    price_cents: '45000',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Linen Theory Jacket',
    category: 'Costume',
    description: 'Clean blazer, suited for any occasion.',
    address: 'Rue Imilchil Casablanca',
    price_cents: '45000',
    gender: 'Men',
    user_id: User.first.id
  }
]

Product.create!(products)

puts "products created !"

puts "creating orders..."

orders = [
  {
    amount_cents: 3 * Product.first.price_cents,
    start_date: Date.today,
    end_date: Date.today + 3,
    product_id: Product.first.id,
    user_id: Product.first.user.id
  },
  {
    status: "accepted",
    amount_cents: 3 * Product.last.price_cents,
    start_date: Date.today + 2,
    end_date: Date.today + 5,
    product_id: Product.last.id,
    user_id: Product.last.user.id
  }
]

Order.create!(orders)

puts "orders created !"

puts "Seeding Products Images"

blazer_beige_richard_james = Dir.entries("app/assets/images/blazer_beige_richard_james").select do |entry|
  File.file?("app/assets/images/blazer_beige_richard_james/#{entry}")
end.map  do |image_name|
  Cloudinary::Uploader.upload("app/assets/images/blazer_beige_richard_james/#{image_name}")
  end.map do |element|
  "#{element["resource_type"]}/#{element["type"]}/v#{element["version"]}/#{element['public_id']}.#{element['format']}"
  end



