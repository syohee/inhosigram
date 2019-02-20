class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 10}
  validates :password, presence: true
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
  has_secure_password
  before_validation { email.downcase! }
  
  has_many :pictures
  has_one :profile
  has_many :favorites, dependent: :destroy
  has_many :favorite_pictures, through: :favorites, source: :picture
  
end
