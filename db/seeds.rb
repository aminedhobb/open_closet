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
    title: 'pull rose',
    category: 'Sweater',
    description: 'magnifique pull rose',
    address: '33 rue de lourmel Paris',
    price_cents: '2000',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'chemise verte',
    category: 'Shirt',
    description: 'magnifique chemise verte',
    address: 'rue imilchil Casablanca',
    price_cents: '200',
    gender: 'Unisex',
    user_id: User.first.id
  },
  {
    title: 'sac luis vuittan',
    category: 'Bag',
    description: 'magnifique sac à main',
    address: 'rue de restinga Casablanca',
    price_cents: '4000',
    gender: 'Women',
    user_id: User.first.id
  },
  {
    title: 'dc shoes',
    category: 'Shoes',
    description: 'magnifique sac à main',
    address: 'rue curie Casablanca',
    price_cents: '400',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Beau costard',
    category: 'Costume',
    description: 'magnifique costard',
    address: 'boulevard zerktouni Casablanca',
    price_cents: '5000',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Beau jean',
    category: 'Pant',
    description: 'magnifique jean',
    address: 'rue deparcieux Paris',
    price_cents: '400',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'chemise de ouf',
    category: 'Shirt',
    description: 'magnifique chemise',
    address: 'rue de rennes Paris',
    price_cents: '1000',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'sac prada',
    category: 'Bag',
    description: 'beautiful bag',
    address: 'New York',
    price_cents: '2000',
    gender: 'Women',
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

