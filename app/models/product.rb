class Product < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  pg_search_scope :search_by_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

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
