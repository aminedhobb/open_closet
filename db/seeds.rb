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
    password:'bakjaelj',
    id: 2,
    avatar: "https://vignette.wikia.nocookie.net/fr.starwars/images/3/39/Jabba_le_Hutt.png/revision/latest?cb=20170818180549"
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
    price_cents: '20',
    gender: 'Men',
    user_id: 2
  },
  {
    title: 'chemise verte',
    category: 'Shirt',
    description: 'magnifique chemise verte',
    address: 'rue imilchil Casablanca',
    price_cents: '2',
    gender: 'Unisex',
    user_id: 2
  },
  {
    title: 'sac luis vuittan',
    category: 'Bag',
    description: 'magnifique sac à main',
    address: 'rue de restinga Casablanca',
    price_cents: '40',
    gender: 'Women',
    user_id: 2
  },
  {
    title: 'dc shoes',
    category: 'Shoes',
    description: 'magnifique sac à main',
    address: 'rue curie Casablanca',
    price_cents: '4',
    gender: 'Men',
    user_id: 2
  },
  {
    title: 'Beau costard',
    category: 'Costume',
    description: 'magnifique costard',
    address: 'boulevard zerktouni Casablanca',
    price_cents: '50',
    gender: 'Men',
    user_id: 2
  },
  {
    title: 'Beau jean',
    category: 'Pant',
    description: 'magnifique jean',
    address: 'rue deparcieux Paris',
    price_cents: '4',
    gender: 'Men',
    user_id: 2
  },
  {
    title: 'chemise de ouf',
    category: 'Shirt',
    description: 'magnifique chemise',
    address: 'rue de rennes Paris',
    price_cents: '10',
    gender: 'Men',
    user_id: 2
  }

]

Product.create!(products)

puts "products created !"

