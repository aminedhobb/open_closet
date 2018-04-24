class Product < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :orders
  has_many :reviews, through: :orders, dependent: :destroy
  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :price_cents, presence: true
  validates :gender, presence: true, inclusion: {in: ['Women', 'Men', 'Unisex']}
end