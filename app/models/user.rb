class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :doctors, through: :reservations

  validates :name, presence: true
end
