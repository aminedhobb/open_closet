# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Product.destroy_all

puts "Creating user.."

users = [
  {
    first_name:'Jabba',
    last_name:'LeHutt',
    email:'jabbalehutt@starwars.com',
    password:'bakjaelj',
    id: 2
  }
]
User.create!(users)

puts "User created!"

puts "Creating products.."

products = [
  {
    title: 'pull rose',
    category: 'pull',
    description: 'magnifique pull rose',
    address: '33 rue de lourmel',
    price_cents: '2000',
    gender: 'Men',
    user_id: 2
  },
  {
    title: 'chemise verte',
    category: 'chemise',
    description: 'magnifique chemise verte',
    address: 'rue imilchil Casablanca',
    price_cents: '200',
    gender: 'Unisex',
    user_id: 2
  },
  {
    title: 'sac luis vuittan',
    category: 'sac',
    description: 'magnifique sac à main',
    address: 'rue de restinga Casablanca',
    price_cents: '4000',
    gender: 'Women',
    user_id: 2
  }
]

Product.create!(products)

puts "products created !"

