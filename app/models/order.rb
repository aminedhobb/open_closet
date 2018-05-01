class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_one :review
  has_many :messages, dependent: :destroy
  validates :start_date, presence: true
  validates :end_date, presence: true
  monetize :amount_cents
  validates_with OrderValidator

end
