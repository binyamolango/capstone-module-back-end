class User < ApplicationRecord
  has_secure_password

  has_many :reservations, dependent: :destroy
  has_many :doctors, through: :reservations

  validates_confirmation_of :password
  validates :email, presence: true, uniqueness: true
end
