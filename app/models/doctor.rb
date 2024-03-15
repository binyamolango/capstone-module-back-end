class Doctor < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  validates :name, presence: true
  validates :image_url, presence: true
  validates :doctor_type, presence: true
  validates :address, presence: true
end
