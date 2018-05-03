class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products, dependent: :destroy
  has_many :orders
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end
