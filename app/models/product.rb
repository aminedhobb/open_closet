class Product < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :product_images, dependent: :destroy
  has_many :orders
  has_many :reviews, through: :orders, dependent: :destroy
  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :price_cents, presence: true
  validates :gender, presence: true, inclusion: {in: ['Women', 'Men', 'Unisex']}
  monetize :price_cents
end
