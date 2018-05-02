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
    title: 'Pink Sweater',
    category: 'Sweater',
    description: 'All goys will love your amazing pink sweater',
    address: '33 rue de lourmel Paris',
    price_cents: '2000',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Green Shirt',
    category: 'Shirt',
    description: 'You will seem very trendy with this green shirt',
    address: 'rue imilchil Casablanca',
    price_cents: '200',
    gender: 'Unisex',
    user_id: User.first.id
  },
  {
    title: 'Louis Vuitton Bag',
    category: 'Bag',
    description: 'With this classic Louis Vuitton bag, you will get a lot of reviews from all jealous girls',
    address: 'rue de restinga Casablanca',
    price_cents: '4000',
    gender: 'Women',
    user_id: User.first.id
  },
  {
    title: 'DC Shoes',
    category: 'Shoes',
    description: 'You will like this nice DC shoes',
    address: 'rue curie Casablanca',
    price_cents: '400',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Classic Suit',
    category: 'Suit',
    description: 'You will shine with this classic suit',
    address: 'boulevard zerktouni Casablanca',
    price_cents: '5000',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Nice Pant',
    category: 'Pant',
    description: 'You are the king of the night with this amazing pant',
    address: 'rue deparcieux Paris',
    price_cents: '400',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Crazy shirt',
    category: 'Shirt',
    description: 'You will never regret this crazy shirt',
    address: 'rue de rennes Paris',
    price_cents: '1000',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Prada bag',
    category: 'Bag',
    description: 'With this nice Prada bag, you will feel the rythm of the fashion week ;)',
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

