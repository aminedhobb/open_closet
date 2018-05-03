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
    avatar: 'https://vignette.wikia.nocookie.net/fr.starwars/images/3/39/Jabba_le_Hutt.png/revision/latest?cb=20170818180549',
  },
  {
    first_name: 'Sebulba',
    last_name: 'LeDug',
    email: 'sebulba@starwars.com',
    password: 'sebulba',
    avatar: "https://vignette.wikia.nocookie.net/starwars/images/f/f4/Sebulba-SWISE2010.jpg/revision/latest?cb=20110306033904",
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
    title: 'Blue Boglioli Blazer',
    category: 'Costume',
    description: 'Clean blue blazer, a classic.',
    address: 'Rue Imilchil Casablanca',
    price_cents: '4500',
    gender: 'Men',
    user_id: User.last.id
  },
  {
    title: 'Max Mara Blue Jacket',
    category: 'Costume',
    description: 'Suited for an interview, a working day, or a formal event.',
    address: 'Rue de Temple, Paris',
    price_cents: '4100',
    gender: 'Women',
    user_id: User.first.id
  },
  {
    title: 'Grey Blazer Isabel Marant',
    category: 'Costume',
    description: 'Modern Blazer',
    address: '6 Avenue Marceau, Paris',
    price_cents: '3500',
    gender: 'Women',
    user_id: User.last.id
  },
  # {
  #   title: 'Grey Suit Paul Smith',
  #   category: 'Costume',
  #   description: 'Costume perfectly suited for an interview if you want to look sharp.',
  #   address: 'Rue Curie, Casablanca',
  #   price_cents: '5000',
  #   gender: 'Men',
  #   user_id: User.first.id
  # },
  {
    title: 'Green Boglioli Jacket',
    category: 'Costume',
    description: 'Original green blazer, great seasonnal look.',
    address: 'Rue Imilchil, Casablanca',
    price_cents: '4000',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Black Stella McCartney Coat',
    category: 'Costume',
    description: "Beautiful Coat, original and trendy, you won't go unnoticed.",
    address: 'Rue Imilchil, Casablanca',
    price_cents: '4500',
    gender: 'Women',
    user_id: User.last.id
  },
  {
    title: 'Gucci Evening Dress',
    category: 'Costume',
    description: 'Magic Dress, you will shine and be the star of the evening.',
    address: 'Rue Imilchil, Casablanca',
    price_cents: '8500',
    gender: 'Women',
    user_id: User.first.id
  },
  {
    title: 'Marchesa Evening Dress',
    category: 'Costume',
    description: 'The perfect dress to be remembered by everyone at the event.',
    address: 'Rue Imilchil, Casablanca',
    price_cents: '9000',
    gender: 'Women',
    user_id: User.first.id
  },
  {
    title: 'Satin Dress Danielle Frankel',
    category: 'Costume',
    description: 'A really classy dress for special occasions.',
    address: 'Rue Imilchil, Casablanca',
    price_cents: '7500',
    gender: 'Women',
    user_id: User.last.id
  },
  {
    title: 'Balenciaga Black Bag',
    category: 'Bag',
    description: 'A true Classic.',
    address: 'Rue Imilchil, Casablanca',
    price_cents: '5000',
    gender: 'Men',
    user_id: User.first.id
  },
  {
    title: 'Dolce & Gabbana Bag',
    category: 'Bag',
    description: 'Modern Bag.',
    address: 'Rue Imilchil Casablanca',
    price_cents: '4300',
    gender: 'Men',
    user_id: User.last.id
  },
  {
    title: 'Givenchy Black Bag',
    category: 'Bag',
    description: 'Beautiful Givenchy bag.',
    address: 'Rue Imilchil Casablanca',
    price_cents: '4500',
    gender: 'Women',
    user_id: User.first.id
  },
  {
    title: 'Prada Bag',
    category: 'Bag',
    description: 'Classic Prada bag.',
    address: 'Rue Imilchil Casablanca',
    price_cents: '4500',
    gender: 'Women',
    user_id: User.first.id
  },
  {
    title: 'Red Saint-Laurent Bag',
    category: 'Bag',
    description: 'Great practical bag.',
    address: 'Rue Imilchil Casablanca',
    price_cents: '4500',
    gender: 'Women',
    user_id: User.first.id
  },
  {
    title: 'Fendi Bag',
    category: 'Bag',
    description: 'Original Fendi bag',
    address: 'Rue Imilchil Casablanca',
    price_cents: '4500',
    gender: 'Women',
    user_id: User.last.id
  },
  {
    title: 'Linen Theory Jacket',
    category: 'Costume',
    description: 'Clean blazer, suited for any occasion.',
    address: 'Rue Imilchil Casablanca',
    price_cents: '4500',
    gender: 'Women',
    user_id: User.last.id
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

class SeedUploader

  def upload_product(images_directory: , title:)
    images_links = upload_images(images_directory)
    product = Product.find_by(title: title)
    attachement_photo(images_links, product)
  end

  private

  def upload_images(file)
    Dir.entries("app/assets/images/#{file}").select do |entry|
      File.file?("app/assets/images/#{file}/#{entry}")
    end.map  do |image_name|
      Cloudinary::Uploader.upload("app/assets/images/#{file}/#{image_name}")
    end.map do |element|
      "#{element["resource_type"]}/#{element["type"]}/v#{element["version"]}/#{element['public_id']}.#{element['format']}"
    end
  end

  # def find_product(product_name)
  #   Product.find_by(title: "#{product_name}")
  # end
  # binding.pry

  def attachement_photo(product_images, product)
    product_images.each do |image|
      pi = ProductImage.new(product_id: product.id)
      pi.save! validate: false
      pi.update_columns photo: image
    end
  end
  # def attach_photo_to_product(file_name,product_name)
  #   seed_uploader = SeedUploader.new
  #   file = seed_uploader.upload_images("file_name")
  #   product = Product.find_by(title:"product_name")
  #   seed_uploader.attachement_photo(file,product)
  # end
end

puts 'uplaoding image from file'

seed_uploader = SeedUploader.new

seed_uploader.upload_product(
  images_directory:  "blazer_beige_richard_james",
  title: "Blazer Richard James")
seed_uploader.upload_product(images_directory: "blazer_bleu_boglioni", title: "Blue Boglioli Blazer")
seed_uploader.upload_product(images_directory: "blazer_bleu_ciel_max_mara", title: "Max Mara Blue Jacket")
seed_uploader.upload_product(images_directory: "blazer_gris_isabel_marant", title: "Grey Blazer Isabel Marant")
seed_uploader.upload_product(images_directory: "blazer_vert_boglioni", title: "Green Boglioli Jacket")
seed_uploader.upload_product(images_directory: "manteau_noir_stella_mccartney", title: "Black Stella McCartney Coat")
seed_uploader.upload_product(images_directory: "robe_du_soir_gucci", title: "Gucci Evening Dress")
seed_uploader.upload_product(images_directory: "robe_du_soir_marchesa", title: "Marchesa Evening Dress")
seed_uploader.upload_product(images_directory: "robe_satin_danielle_frankel", title: "Satin Dress Danielle Frankel")
seed_uploader.upload_product(images_directory: "sac_balenciaga_noir", title: "Balenciaga Black Bag")
seed_uploader.upload_product(images_directory: "sac_dg_rose", title: "Dolce & Gabbana Bag")
seed_uploader.upload_product(images_directory: "sac_givenchy_noir", title: "Givenchy Black Bag")
seed_uploader.upload_product(images_directory: "sac_prada", title: "Prada Bag")
seed_uploader.upload_product(images_directory: "sac_rouge_ysl", title:"Red Saint-Laurent Bag")
seed_uploader.upload_product(images_directory: "sac_runway_fendi", title:"Fendi Bag")
seed_uploader.upload_product(images_directory: "tailleur_lin_theory", title: "Linen Theory Jacket")


puts "okay"
# richard_james = seed_uploader.upload_images("blazer_beige_richard_james")
# richard_james_product = Product.find_by(title: "Blazer Richard James")
# seed_uploader.attachement_photo(richard_james, richard_james_product)

# bleu_boglioni = seed_uploader.upload_images("blazer_bleu_boglioni")
# bleu_boglioni_product = Product.find_by(title: "Blue Boglioni Blazer")
# seed_uploader.attachement_photo(bleu_boglioni, bleu_boglioni_product)

# bleu_max_mara = seed_uploader.upload_images("blazer_bleu_ciel_max_mara")
# bleu_max_mara_product = Product.find_by(title: "Max Mara Blue Jacket")
# seed_uploader.attachement_photo(bleu_max_mara, bleu_max_mara_product)

# gris_isabel_marant = seed_uploader.upload_images("blazer_gris_isabel_marant")
# gris_isabel_marant_product = Product.find_by(title: "Grey Blazer Isabel Marant")
# seed_uploader.attachement_photo(gris_isabel_marant, gris_isabel_marant_product)

# gris_paul_smith = seed_uploader.upload_images("blazer_gris_paul_smith")
# gris_paul_smith_product = Product.find_by(title: "Grey Suit Paul Smith")
# seed_uploader.attachement_photo(gris_paul_smith, gris_paul_smith_product)

# vert_boglioni = seed_uploader.upload_images('blazer_vert_boglioni')
# vert_boglioni_product = Product.find_by(title:"Green Boglioni Jacket")
# seed_uploader.attachement_photo(vert_boglioni, vert_boglioni_product)

# noir_stella_mccartney = seed_uploader.upload_images("manteau_noir_stella_mccartney")
# noir_stella_mccartney_product = Product.find_by(title:"Black Stella McCartney Coat")
# seed_uploader.attachement_photo(noir_stella_mccartney, noir_stella_mccartney_product)

# soir_gucci = seed_uploader.upload_images("robe_du_soir_gucci")
# soir_gucci_product = Product.find_by(title:"Gucci Evening Dress")
# seed_uploader.attachement_photo(soir_gucci, soir_gucci_product)



